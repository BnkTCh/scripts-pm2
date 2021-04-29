#!/bin/bash

pm2 status | grep awk '{print $3}'
