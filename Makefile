define BROWSER_PYSCRIPT
import os, webbrowser, sys

try:
	from urllib import pathname2url
except:
	from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"


create-conda-env-file:
	env `cat .env` ./_setup/create_conda_env_file.sh


create-conda-env: create-conda-env-file
	./_setup/create_conda_env.sh


create-ci-dotenv-file:
	./_setup/create_ci_dotenv_file.sh


create-bodo-license-file:
	env `cat .env` ./_setup/create_bodo_license_file.sh


create-ipython-profile:
	./_setup/create_ipython_profile.sh


launch-jupyterlab: create-ipython-profile start-mpi-controllers
	jupyter-lab


restart-mpi-controllers: stop-mpi-controllers start-mpi-controllers


run-tests: restart-mpi-controllers
	pytest --nbmake -vv notebooks/*.ipynb
	$(MAKE) stop-mpi-controllers


start-mpi-controllers:
	./_setup/start_mpi_controllers.sh


stop-mpi-controllers:
	./_setup/stop_mpi_controllers.sh


# DOCS


create-docs-env:
	conda env create -n bodo-docs --file _setup/environment-docs.yaml


build-docs:
	mkdir -p docs
	rm -rf ./docs/_build
	jupyter-book build notebooks
	mv ./notebooks/_build docs/
	echo "Documentation available at:"
	echo `pwd`/docs/_build/html/index.html


open-docs: build-docs
	$(BROWSER) docs/_build/html/index.html
