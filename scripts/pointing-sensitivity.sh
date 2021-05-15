#!/bin/bash

# configure the sensitivity of TrackPoint & TrackPad
xinput --set-prop 'TPPS/2 Elan TrackPoint' 'libinput Accel Speed' -0.2

xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Accel Speed' 0.5
