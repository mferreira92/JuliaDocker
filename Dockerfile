FROM julia:1.2.0-stretch

RUN julia -e "import Pkg;pkg_arr=[\"DataFrames\",\"CSV\"];for p in pkg_arr Pkg.add(p) end"
