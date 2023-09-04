#!/bin/bash

set -e

echo "[INFO] Install EDA packages via PIP"
pip3 install --upgrade --no-cache-dir \
	amaranth \
	cocotb \
	edalize \
	fusesoc \
	gdsfactory \
	gdspy \
	openlane \
	openram \
	pyrtl \
	pyspice \
	pyverilog \
	siliconcompiler \
	spyci \
	volare

pip3 install --upgrade --no-cache-dir \
	jupyter \
	jupyter-collaboration \
	jupyterlab-night

pip3 install --upgrade --no-cache-dir \
    pypresence \
    polyphony

echo "[INFO] Install EDA packages via GEM"
gem install \
	rggen \
	rggen-verilog \
	rggen-vhdl

echo "[INFO] Install EDA packages via NPM"
npm install -g \
	netlistsvg
