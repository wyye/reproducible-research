#!/bin/bash

source activate plot
jupyter notebook --notebook-dir=/app/notebooks --ip=0.0.0.0 --port=8888 --allow-root --no-browser
