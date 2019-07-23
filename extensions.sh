# Choose conda and load the virtual environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate jupyter-lab

# Node JS for the extensions
conda install -c conda_forge nodejs
export NODE_OPTIONS=--max-old-space-size=4096

# Jupyter Lab code formatter with black
conda install -c conda_forge black jupyterlab_code_formatter
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_code_formatter

# Jupyter widgets extension, FigureWidget and renderer support
jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.0 --no-build
jupyter labextension install jupyterlab-plotly@1.0.0 --no-build
jupyter labextension install plotlywidget@1.0.0 --no-build

# Go To Definition extension
jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build

# Spell checker extension
jupyter labextension install @ijmbarr/jupyterlab_spellchecker --no-build

# Build extensions
jupyter lab build

unset NODE_OPTIONS
