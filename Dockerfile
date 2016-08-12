FROM ubuntu

# Register arguments
ARG cname_flags=-DENABLE_CONTENT_PATCHING=OFF
ARG rpc_port=8090

# Install necessary packages
RUN apt-get update \
&&	apt-get install -qy build-essential git libssl-dev \
	m4 yasm autogen automake libtool doxygen python3 python-dev \
	autotools-dev libicu-dev libbz2-dev cmake g++ \
	wget pkg-config libgmp-dev libboost-all-dev \
&&	apt-get clean

# Clone steem repository.
WORKDIR /usr/local/steem
RUN git clone https://github.com/steemit/steem src \
&&	cd /usr/local/steem/src \
&&	git submodule update --init --recursive \
&&	cmake ${cname_flags} . \
&&	make \
&&	make install

# Expose the RPC port.
EXPOSE ${rpc_port}

# Clean up APT when done.
RUN apt-get clean \
&& 	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD	/usr/local/bin/steemd --rpc-endpoint -d /mnt/witness_node_data_dir
