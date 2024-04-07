
bash starterBuddi.sh
bash install_conda_envContainer.sh
eval "$(conda shell.bash hook)"
conda activate hhcenv39

cd ../buddi
bash fetch_data.sh
bash fetch_bodymodels.sh
bash install_thirdparty.sh


cp essentials/body_models/smpl/SMPL_NEUTRAL.pkl smpl_model_data/SMPL_NEUTRAL.pkl
cp smpl/SMPL_NEUTRAL.pkl smpl_model_data/SMPL_NEUTRAL.pkl
pip install numpy==1.22.4
romp.prepare_smpl -source_dir=smpl_model_data

cp -r  essentials/body_models/smil smpl_model_data/smil
bev.prepare_smil -source_dir=buddi/essentials/body_models

cp -r .romp buddi/essentials/body_models/smpla
cp smpl_model_data/J_regressor_extra.npy essentials/body_models/J_regressor_extra.npy
cp buddi/smpl_model_data/J_regressor_h36m.npy buddi/essentials/body_models/J_regressor_h36m.npy
cp ../.romp/smil_packed_info.pth essentials/body_models/smil/smil_packed_info.pth

bash demo.sh
