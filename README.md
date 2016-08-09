# steemd-dockerized

## Provide datadir and config

1. mkdir `$PATH/witness_node_data_dir`
2. Configure - Copy `config.ini.example` to `config.ini` to the `witness_node_data_dir` folder and modify as needed.

## The Steemd Container

1. Build - `docker build -t steemd-dockerized .` There is a bunch of arguments available,
   please check `Dockerfile` for what is possible to overwrite.
2. Run - `docker run -d -P -v $PATH/witness_node_data_dir:/steemdata/witness_node_data_dir --name steemd steemd-dockerized`
3. You can see what is happening now by running `docker logs -f steemd`.
