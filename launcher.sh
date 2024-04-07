
bash starterBuddi.sh
bash install_conda_envContainer.sh
eval "$(conda shell.bash hook)"
conda activate hhcenv39

cd ../buddi
bash fetch_data.sh
bash fetch_bodymodels.sh
bash install_thirdparty.sh
bash demo.sh
