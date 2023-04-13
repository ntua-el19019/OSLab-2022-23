cmake_minimum_required(VERSION 3.25)
project(ex2 C)

set(CMAKE_C_STANDARD 11)

include_directories(forktree)

add_executable(ex2
        forktree/ask2-fork.c
        forktree/ask2-signals.c
        forktree/fork-example.c
        forktree/pipe-example.c
        forktree/proc-common.c
        forktree/proc-common.h
        forktree/tree-example.c
        forktree/tree.c
        forktree/tree.h)
