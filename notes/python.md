```
# create
python3 -m venv venv

# start
source venv/bin/activate

# exit
deactivate

# build requirements.txt
pip freeze > requirements.txt

# install
pip install -r requirements.txt

# gunicorn
gunicorn svc:app



```