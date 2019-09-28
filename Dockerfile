FROM julia:1.2.0-stretch

RUN apt-get update
RUN apt-get install -y procps telnetd

RUN julia -e "import Pkg;Pkg.add(\"DataFrames\")" && \
    julia -e "import Pkg;Pkg.add(\"CSV\")" && \
    julia -e "import Pkg;Pkg.add(\"Mongoc\")" && \
    julia -e "import Pkg;Pkg.add(\"JSON\")" && \
    julia -e "import Pkg;Pkg.add(\"HTTP\")" && \
    julia -e "import Pkg;Pkg.add(\"JLD2\")" && \
    julia -e "import Pkg;Pkg.add(\"WebSockets\")" && \
    julia -e "import Pkg;Pkg.add(\"Conda\")" && \
    julia -e "import Pkg;Pkg.add(\"IJulia\")" && \
    julia -e "import Pkg;Pkg.build(\"IJulia\")" && \
    julia -e "using Conda;Conda.add(\"jupyterlab\")" && \
    julia -e "using IJulia;jupyterlab(detached=true)"

