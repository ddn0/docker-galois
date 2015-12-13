## Sample Galois build environment in Docker

This is a basic build environment for playing around with the [Galois
library](iss.ices.utexas.edu/?p=projects/galois), a runtime library for
parallelizing applications. 

It is only suitable for program development as running Galois applications
inside this container will not take advantage of certain OS features
(threading, large pages) that are required for good parallel performance.

### Building

```sh
docker build -t galois .
```

### Running

To start a docker container:

```sh
docker run -it galois
```

Once you are inside the container, you can configure the build:

```sh
cd /root/build && cmake ../Galois-2.2.1
```

Build the suite of Galois applcations:

```sh
make -C /root/build
```

And run the applications:

```sh
cd /root/build && ../Galois-2.2.1/scripts/run_small.sh
```
