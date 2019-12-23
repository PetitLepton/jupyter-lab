# Choose conda and load the virtual environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate jupyter-lab

export NODE_OPTIONS=--max-old-space-size=4096

jupyter labextension install @jupyterlab/git --no-build --debug
jupyter labextension install @jupyterlab/toc --no-build --debug
jupyter labextension install @ryantam626/jupyterlab_code_formatter --no-build --debug
jupyter serverextension enable --py jupyterlab_code_formatter
jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build --debug
jupyter labextension install @ijmbarr/jupyterlab_spellchecker --no-build --debug
jupyter labextension install @parente/jupyterlab-quickopen --no-build --debug

jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.0 --no-build --debug
jupyter labextension install jupyterlab-plotly@1.2.0 --no-build --debug
jupyter labextension install plotlywidget@1.2.0 --no-build --debug

jupyter lab build --minimize=False

unset NODE_OPTIONS
