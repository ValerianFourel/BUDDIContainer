conda create -n hhcenv39 python=3.9 -y
eval "$(conda shell.bash hook)"
conda activate hhcenv39
pip install cython gdown wandb
