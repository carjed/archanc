# Start from a core stack version
FROM jupyter/datascience-notebook:1a66dd36ff82
# Install in the default python3 environment
RUN conda install --quiet --yes \
    'stdpopsim=0.1.2'

RUN jupyter labextension install @jupyterlab/server-proxy


RUN conda install -c conda-forge jupyter-server-proxy

# RUN conda install -c conda-forge jupyter-rsession-proxy
