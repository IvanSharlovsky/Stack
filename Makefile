APP_DIR ?= 
APP := quadratic_equation_solver

CC ?= gcc
QEMU_USER ?= qemu-x86_64
CFLAGS ?= -O3 -Wall -Wextra -Werror
LFLAGS ?=
DEBUG_FLAGS ?= -DEBUG -O0 -Og -Wall -Wextra -Werror
TARGET ?= main
CONTAINER ?= rv_tools_experiments

BUILD_DIR := ./build
SRC_DIR := ./sources
INC_DIR := ./include
SRCS := $(shell find $(SRC_DIR) -name *.c)
OBJS := $(addsuffix .o,$(basename $(SRCS)))
.DEFAULT_GOAL := main