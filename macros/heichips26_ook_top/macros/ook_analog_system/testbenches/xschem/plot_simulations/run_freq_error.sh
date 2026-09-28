#!/usr/bin/env bash
cd /home/belal/HeiChips/heichips26-on-off
nix-shell --run 'python3 macros/heichips26_ook_top/macros/ook_analog_system/testbenches/xschem/plot_simulations/freq_error_plot.py'
