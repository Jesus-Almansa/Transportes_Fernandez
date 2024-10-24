#!/bin/sh
#exec gunicorn --bind 0.0.0.0:5000 --workers=4 app:app

#!/bin/sh
gunicorn --chdir app app:app -w 2 --threads 2 -b 0.0.0.0:80
