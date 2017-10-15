FROM everware/base
USER root
RUN ["apt-get", "install", "-f", "make"]
USER jupyter
WORKDIR /home/jupyter/
ADD requirements.yml /home/jupyter
RUN ["conda", "env", "create", "-f", "/home/jupyter/requirements.yml"]
ENV PATH /opt/conda/envs/plot/bin:$PATH
ENV CONDA_PREFIX /opt/conda/envs/plot
ENV CONDA_DEFAULT_ENV plot
RUN mkdir -p /home/jupyter/notebooks
ADD start-notebook.sh /home/jupyter
ADD plot.py /home/jupyter
ADD Makefile /home/jupyter
ADD plot.ipynb plot.ipynb
ADD hw3.ipynb /home/jupyter
EXPOSE 8888
#CMD ["/home/jupyter/start-notebook.sh"]
#CMD ["/bin/bash"]

