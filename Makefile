APP := stack

CC ?= gcc
CFLAGS ?= -O3 -Wall -Wextra -Werror
LFLAGS ?=
DEBUG_FLAGS ?= -DEBUG -O0 -Og -Wall -Wextra -Werror

BUILD_DIR := ./build
SRC_DIR := ./sources
INC_DIR := ./include
SRCS := $(shell find $(SRC_DIR) -name *.c)
OBJS := $(BUILD_DIR)/main.o $(BUILD_DIR)/stack.o $(BUILD_DIR)/tests.o
.DEFAULT_GOAL := build

_build_dir:
	@mkdir -p $(BUILD_DIR)

run: build
	$(BUILD_DIR)/$(APP)

build: _build_dir $(OBJS)
	$(CC) $(OBJS) $(LFLAGS) -lm -o $(BUILD_DIR)/$(APP)

$(BUILD_DIR)/main.o: main.c $(INC_DIR)/stack.h $(INC_DIR)/tests.h
	$(CC) -I $(INC_DIR) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/stack.o: $(SRC_DIR)/stack.c $(INC_DIR)/stack.h
	$(CC) -I $(INC_DIR) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/tests.o: $(SRC_DIR)/tests.c $(INC_DIR)/tests.h
	$(CC) -I $(INC_DIR) -c $(CFLAGS) $< -o $@

debug: _build_dir main.c $(wildcard $(SRC_DIR)/*.c) $(wildcard $(INC_DIR)/*.h)
	$(CC) -I $(INC_DIR) $(DEBUG_FLAGS) main.c $(wildcard $(SRC_DIR)/*.c) $(wildcard $(INC_DIR)/*.h) -o $(BUILD_DIR)/$@

.PHONY: clean valgrind run build _build_dir

clean:
	rm -r $(BUILD_DIR)

valgrind:
	valgrind ./$(APP)