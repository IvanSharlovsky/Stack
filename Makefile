APP_DIR ?= 
APP := stack

CC ?= gcc
QEMU_USER ?= qemu-x86_64
CFLAGS ?= -O3 -Wall -Wextra -Werror
LFLAGS ?=
DEBUG_FLAGS ?= -DEBUG -O0 -Og -Wall -Wextra -Werror

BUILD_DIR := ./build
SRC_DIR := ./sources
INC_DIR := ./include
SRCS := $(shell find $(SRC_DIR) -name *.c)
OBJS := $(addsuffix .o,$(basename $(SRCS)))
.DEFAULT_GOAL := main

main: _build_dir $(OBJS)
	$(CC) $(OBJS) $(LFLAGS) -lm -o $(BUILD_DIR)/$(APP)

$(BUILD_DIR)/main.o: main.c $(INC_DIR)/stack.h $(INC_DIR)/tests.h
	$(CC) -I $(INC_DIR) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/stack.o: $(SRC_DIR)/stack.c $(INC_DIR)/stack.h
	$(CC) -I $(INC_DIR) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/tests.o: $(SRC_DIR)/tests.c $(INC_DIR)/tests.h
	$(CC) -I $(INC_DIR) -c $(CFLAGS) $< -o $@

debug: _build_dir main.c $(SRC_DIR)/$(wildcard *.c) $(INC_DIR)/$(wildcard *.h)
	$(CC) -I $(INC_DIR) $(DEBUG_FLAGS) $^ -o $(BUILD_DIR)/debug