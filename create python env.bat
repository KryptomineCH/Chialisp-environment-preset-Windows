:: changelog
:: Author: Julian Bechtold
:: 15.Jun.2022 - initial creation 
:: create virtual environment folder
python -m venv venv
echo python environment created
:: upgrade pip and install chia
venv\Scripts\python.exe -m pip install --upgrade pip
venv\Scripts\python.exe -m pip install chia-dev-tools
:: print summary
echo Chia and Virtual environement have been installed. 
echo Try by running ..\venv\Scripts\activate
echo and then chia
pause
