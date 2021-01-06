.PHONY: create-conda-env-file create-conda-env create-ci-dotenv-file create-bodo-license-file create-ipython-profile launch-jupyterlab restart-mpi-controllers run-tests start-mpi-controllers stop-mpi-controllers create-docs-env build-docs open-docs

.DEFAULT_GOAL := help

define BROWSER_PYSCRIPT
import os, webbrowser, sys

try:
	from urllib import pathname2url
except:
	from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT


.PHONY: help
help: ## Show this help message.
	@echo 'usage: make [target] ...'
	@echo ''
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

create-conda-env-file: ## Create the conda environment file.
	env `cat .env` ./_setup/create_conda_env_file.sh


create-conda-env: create-conda-env-file ## create the conda environment.
	./_setup/create_conda_env.sh


create-ci-dotenv-file: ## Create the .env file for the project.
	./_setup/create_ci_dotenv_file.sh


create-bodo-license-file: ## Create the bodo license file with the value stored at the .env file.
	env `cat .env` ./_setup/create_bodo_license_file.sh


create-ipython-profile: ## Create the ipython profile for mpi.
	./_setup/create_ipython_profile.sh


launch-jupyterlab: create-ipython-profile start-mpi-controllers ## Lauch the JupyterLab with MPI.
	jupyter-lab


restart-mpi-controllers: stop-mpi-controllers start-mpi-controllers ## Restart MPI controllers.


run-tests: restart-mpi-controllers ## Run tests (locally).
	pytest --nbmake -vv notebooks/*.ipynb
	$(MAKE) stop-mpi-controllers


start-mpi-controllers: ## Start MPI Controllers.
	./_setup/start_mpi_controllers.sh


stop-mpi-controllers: ## Stop MPI Controllers
	./_setup/stop_mpi_controllers.sh


# DOCS


create-docs-env: ## Create the conda environment for documentation.
	conda env create -n bodo-docs --file _setup/environment-docs.yaml


build-docs: ## Build documentation using jupyter-book.
	mkdir -p docs
	rm -rf ./docs/_build
	jupyter-book build notebooks
	mv ./notebooks/_build docs/
	echo "Documentation available at:"
	echo `pwd`/docs/_build/html/index.html


open-docs: build-docs ## Build the documentation and show the documentation in the browser.
	$(BROWSER) docs/_build/html/index.html
