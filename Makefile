.DELETE_ON_ERROR:

CC := gcc

GLKINCLUDEDIR := ../minglk/src
GLKLIBDIR     := ../minglk/bin

SRC_DIR ?= src
OBJ_DIR ?= obj
BIN_DIR ?= bin

ifeq ($(CC), gcc)
CFLAGS += -std=c11 -Wall -I$(GLKINCLUDEDIR)
LDFLAGS += -L$(GLKLIBDIR) -lminglk
endif

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

ifeq ($(OS),Windows_NT)
	TARGET := $(BIN_DIR)/grue.exe
else
	TARGET := $(BIN_DIR)/grue
endif

TARGET := $(BIN_DIR)/grue

ifeq ($(OS), Windows_NT)
	MKDIR = if not exist $(subst /,\\,$(1)) mkdir $(subst /,\\,$(1))
else
	MKDIR = mkdir -p $(1)
endif

ifeq ($(OS), Windows_NT)
	RMDIR = if exist $(subst /,\\,$(1)) rmdir /S /Q $(subst /,\\,$(1))
else
	RMDIR = rm -rf $(1)
endif

all: $(TARGET)

$(TARGET): $(OBJ)
	@$(call MKDIR, $(BIN_DIR))
	@$(CC) $^ $(LDFLAGS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(call MKDIR, $(OBJ_DIR))
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(call RMDIR, $(OBJ_DIR))
	@$(call RMDIR, $(BIN_DIR))

.PHONY: all clean
