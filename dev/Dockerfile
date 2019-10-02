FROM antonioloureiro/julia:latest

RUN apt-get update
RUN apt-get install -y python3 python3-pip telnet git wget nano net-tools zip unzip vim


# Install Jupyter
RUN pip3 install jupyter
RUN pip3 install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

# Install JupyterLab
RUN pip3 install jupyterlab && jupyter serverextension enable --py jupyterlab


RUN julia -e "import Pkg;Pkg.add(\"IJulia\")" && \
    julia -e "import Pkg;Pkg.build(\"IJulia\")"

ENV DIR /workspace
RUN mkdir $DIR
WORKDIR $DIR
CMD jupyter lab --ip=* --port=8888 --no-browser --allow-root --notebook-dir=$DIR

