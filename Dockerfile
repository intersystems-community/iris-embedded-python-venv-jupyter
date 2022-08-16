ARG IMAGE=intersystemsdc/irishealth-community
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

WORKDIR /opt/irisbuild
RUN chown irisowner:irisowner /opt/irisbuild

USER root
RUN apt-get update && apt-get install -y python3.8-venv

USER irisowner

ENV PYTHONPATH=/usr/irissys/lib/python:/usr/irissys/mgr/python
ENV IRISUSERNAME=_SYSTEM
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=USER

# Install your packages here
RUN pip3 install --no-input -q jupyterlab numpy scipy scikit-learn pandas

COPY iris.script .
COPY setup.sh .
COPY start-jupyter.sh .

# Run the IRIS-side setup
RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly 

# Run the Venv- and Jupyter-side setup
RUN ./setup.sh

RUN rm iris.script setup.sh
