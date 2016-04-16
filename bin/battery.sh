#!/bin/bash

echo $(pmset -g ps | grep -E -o '[0-9]+%' | tr -d '%')
