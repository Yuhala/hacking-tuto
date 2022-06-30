
#
# Author: Peterson Yuhala
# 
#


CC := gcc

SRC := .
INCLUDE_PATHS := -I.

#
# No stack protector used so gcc does not use canaries
# to prevent buffer overflows. This is for education purposes
# so we see the results of a buffer overflow.
#
COMPILE_FLAGS := $(INCLUDE_PATHS) -fno-stack-protector
LD_FLAGS := 

HEADERS := $(wildcard *.h)


OBJ_NAMES := buffer_overflow.o main.o
APP_OBJS := $(addprefix $(SRC)/,$(OBJ_NAMES))

MAIN := main

$(SRC)/%.o: $(SRC)/%.c $(HEADERS)
	@$(CC) $(COMPILE_FLAGS) -c $< -o $@
	@echo "CC <= $<" 

$(MAIN): $(APP_OBJS)
	@$(CC) $(COMPILE_FLAGS) $^ -o $@ $(LD_FLAGS)

.PHONY: clean

clean:
	@rm $(APP_NAME) $(APP_OBJS) 