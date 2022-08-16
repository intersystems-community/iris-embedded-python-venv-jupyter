# InterSystems IRIS embedded python + venv + Jupyter

Using Embedded Python with virtual environments and with Jupyter can be a little tricky because, in part, you need to start python by running the `irispython` command instead of `python3`.

This repository is an example of how to create a container that enables python-first development with embedded python, creates a virtual environment named `embedded python` and creates an ipython kernel (which are used in jupyter) that also uses embedded python.

## Building the container

In this directory, run the following:
```
docker build --tag iris-embedded-jupyter .
```

## Running the container

Chances are, you're running this container because you want to run Jupyter with embedded python.  That means you're going to want to run both the IRIS server on port 52773 and jupyter on port 8888.

### Start the container
The most basic way to run the container is:
```
docker run -p 9999:52773 -p 8888:8888 iris-embedded-jupyter --check-caps false
```

### Start jupyter
```
docker exec -it <containerID> ./start-jupyter.sh
```
