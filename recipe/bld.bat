set PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
"%PYTHON%" -m pip install --no-deps --ignore-installed -vv .
if errorlevel 1 exit 1
