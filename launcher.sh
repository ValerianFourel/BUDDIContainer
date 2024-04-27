
bash starterBuddi.sh
bash install_conda_envContainer.sh
eval "$(conda shell.bash hook)"
conda activate hhcenv39

cd ..
git clone https://github.com/muelea/buddi.git
cd buddi
bash fetch_data.sh
bash fetch_bodymodels.sh
bash install_thirdparty.sh

gdown https://github.com/Arthur151/ROMP/releases/download/V2.0/smpl_model_data.zip
unzip smpl_model_data.zip


cp essentials/body_models/smpl/SMPL_NEUTRAL.pkl smpl_model_data/SMPL_NEUTRAL.pkl
pip install numpy==1.22.4
romp.prepare_smpl -source_dir=smpl_model_data

cp -r  essentials/body_models/smil smpl_model_data/smil

cp smpl_model_data/J_regressor_extra.npy essentials/body_models/J_regressor_extra.npy

cd ..
cp buddi/smpl_model_data/J_regressor_h36m.npy buddi/essentials/body_models/J_regressor_h36m.npy
bev.prepare_smil -source_dir=buddi/essentials/body_models
cp .romp/SMPLA_NEUTRAL.pth buddi/essentials/body_models/smpla/SMPLA_NEUTRAL.pth

cd buddi
cp ../.romp/smil_packed_info.pth essentials/body_models/smil/smil_packed_info.pth

bash demo.sh
