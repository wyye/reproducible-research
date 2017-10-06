FROM continuumio/miniconda3
WORKDIR app
ADD requirements.yml /app
RUN ["conda", "env", "create", "-f", "/app/requirements.yml"]
RUN ["apt-get", "install", "-f", "make"]
ENV PATH /opt/conda/envs/plot/bin:$PATH
ENV CONDA_PREFIX /opt/conda/envs/plot
ENV CONDA_DEFAULT_ENV plot
RUN mkdir -p /app/notebooks
ADD start-notebook.sh /app
ADD plot.py /app
ADD Makefile /app
ADD plot.ipynb plot.ipynb
EXPOSE 8888
#CMD ["/app/start-notebook.sh"]
CMD ["/bin/bash"]

