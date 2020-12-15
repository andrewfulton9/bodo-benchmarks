
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


run-tests: restart-mpi-controllers
	pytest --nbmake -vv notebooks/*.ipynb
	$(MAKE) stop-mpi-controllers

restart-mpi-controllers: stop-mpi-controllers start-mpi-controllers


start-mpi-controllers:
	./_setup/start_mpi_controllers.sh


stop-mpi-controllers:
	./_setup/stop_mpi_controllers.sh
