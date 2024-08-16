# STACK

## Education project that implements library for creating and using a stack in `C` and a testing function for it

- ### Implemented main Stack functions: init, push, pop, destroy

- ### Additional functions:check_stack_valid, print_error

## HOW TO BUILD AND RUN

- ### Open terminal in app directory

- ### Print `make build` to build project

- ### Print `make run` to run tests

- ### Print `make debug` to build app with debug options

### Also you can change CC, CFLAGS, LFLAGS, DEBUG_FLAGS values in command line before or after `make [target]`

### Default values:

`CC ?= gcc`

`CFLAGS ?= -O3 -Wall -Wextra -Werror`

`LFLAGS ?= -static`

`DEBUG_FLAGS ?= -DEBUG -O0 -Og -Wall -Wextra -Werror`
