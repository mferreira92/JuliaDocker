FROM julia:1.2.0-stretch

RUN julia -e """import Pkg;pkg_arr=["DataFrames","CSV"];[Pkg.add(p) for p in pkg_arr]"""
