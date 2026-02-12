# Prepare python environment
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

# Prepare MongoDB Development DB
./.devcontainer/installMongoDB.sh
./.devcontainer/startMongoDB.sh