# Makefile for ST7796
# Compiler and compiler flags
DEBUG = -O3
CC = gcc
INCLUDE = -I./inc -I/usr/local/INCLUDE 
CCFLAGS = $(DEBUG) -Wall -pthread $(INCLUDE) -Winline -pipe

LDFLAGS = -L/usr/local/lib
LDLIBS    = -lwiringPi -lwiringPiDev -lpthread -lm -lcrypt -lrt
# Directories
SRC_DIR ?= ./src
BUILD_DIR = build
BIN_DIR = bin
# Source files and target executable
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))
TARGET = $(BIN_DIR)/SerialTest
# Default target
all: $(TARGET)
# Rule to compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CCFLAGS) -c -o $@ $<
# Rule to build the final executable
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CCFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)
#Run
run: $(TARGET)
	@echo ""
	@$(TARGET)
# Clean up
clean:
	@rm -rf $(BUILD_DIR) $(BIN_DIR)
# Phony targets (targets that don't represent files)
.PHONY: all clean run