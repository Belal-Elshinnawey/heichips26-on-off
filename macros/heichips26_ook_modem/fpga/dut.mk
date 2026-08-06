# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

# RTL of the design under test, shared by all boards.

SRC_DIR := ../../../rtl

DUT_SRCS := \
	$(SRC_DIR)/heichips26_ook_modem.sv \
	$(SRC_DIR)/tx_framer.sv \
	$(SRC_DIR)/ook_gate.sv \
	$(SRC_DIR)/ro_model.sv \
	$(SRC_DIR)/rx_sync.sv \
	$(SRC_DIR)/rx_sampler.sv \
	$(SRC_DIR)/rx_deframer.sv
