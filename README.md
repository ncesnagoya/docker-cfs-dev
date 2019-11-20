# core Flight System(cFS) development environment

## About cFS
https://cfs.gsfc.nasa.gov/

## How to use
- Build Dockerfile
```
git clone https://github.com/ncesnagoya/docker-cfs-dev.git
cd docker-cfs-dev
docker build -t cfs-dev-ubuntu .
docker run --rm -it cfs-dev-ubuntu
```

- Pull docker image
```
docker pull mitsu48/cfs-dev-ubuntu:latest
docker run --rm -it mitsu48/cfs-dev-ubuntu:latest
```

## Build sample(after docker run)
```
git clone https://github.com/ncesnagoya/cFS.git
cd cFS
git submodule init
git submodule update

cp cfe/cmake/Makefile.sample Makefile
cp -r cfe/cmake/sample_defs sample_defs
sed -i 's/undef OSAL_DEBUG_PERMISSIVE_MODE/define OSAL_DEBUG_PERMISSIVE_MODE/g' sample_defs/default_osconfig.h

make prep
make
make install
cd build/exe/cpu1/
./core-cpu1
```

## Run GroundSystem.py
- Requirements
    - Installed X server on Host PC
Run the commands on Docker
```
export DISPLAY=<Host-PC IP address>:0.0
tools/cFS-GroundSystem$ python GroundSystem.py
```

## Optional(Add ping tool)
```
apt-get install iputils-ping net-tools
```
