FROM julia:1.2.0-stretch

RUN julia -e "import Pkg;Pkg.add("DataFrames")" && \
    julia -e "import Pkg;Pkg.add("CSV")" && \
    julia -e "import Pkg;Pkg.add("Plots")"


