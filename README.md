# Petit Koka Compiler

A compiler for **Petit Koka**, a subset of the [Koka](https://koka-lang.github.io/koka/doc/index.html) programming language, implemented in **OCaml**.

The project implements the main stages of a compiler pipeline: lexical analysis and parsing, type and effect inference, closure analysis, and **x86-64 assembly generation**.

## Overview

The compiler takes a Petit Koka source program and translates it into x86-64 assembly.

Its main components are:

- an indentation-aware lexer and parser;
- an abstract syntax tree for the language;
- type inference based on **Algorithm W**;
- inference of function effects;
- free-variable and closure analysis;
- support for mutable and immutable variables;
- compilation of functions and higher-order functions;
- compilation of `while`, `for`, and `repeat` loops;
- x86-64 code generation.

## Lexer and Parser

The lexer and parser implement the syntax of Petit Koka, including its
indentation-sensitive structure.

Indentation is handled by an intermediate layer between the lexer and parser:
tokens produced by the lexer are processed to insert the additional tokens
required to represent block structure before being passed to the parser.

Keywords are recognized using a hash table, and precedence rules are used to
resolve parsing conflicts.

The internal AST slightly simplifies the original grammar by merging some
syntactic categories. The parser nevertheless guarantees that only valid
Petit Koka programs produce an AST.

## Type and Effect Inference

The type checker is based on **Algorithm W** and recursively transforms the
parsed AST into a typed AST.

In addition to ordinary type variables, the implementation uses **effect
variables** to infer the effects associated with function return types.

The supported language is monomorphic, so inferred type variables are not
generalized.

## Closures and Free Variables

Before code generation, the compiler computes the free variables of functions
in order to construct their closures.

Captured immutable values are stored by value, while mutable variables are
captured by reference. This allows mutations performed inside a closure to
remain visible outside of it.

The implementation also handles shadowing and nested scopes when determining
which variables remain free inside a block.

## Code Generation

The backend generates **x86-64 assembly**.

Functions are compiled as closures consisting of executable code together
with an environment containing their captured variables. Local variables are
stored on the stack, while closure environments are allocated on the heap.

The compiler also generates control flow for the language's loop constructs,
including `while`, `for`, and `repeat`.

## Building

The project requires OCaml and `make`.

Build the compiler with:

```console
make
```

This produces the `kokac` executable.

## Usage

Compile a Petit Koka program with:

```console
./kokac file.koka
```

For a valid source program, the compiler generates:

```text
file.s
```

The compilation pipeline can also be stopped after parsing or type checking:

```console
./kokac --parse-only file.koka
./kokac --type-only file.koka
```

On Windows, the executable may instead be invoked as:

```console
./kokac.exe file.koka
```

## Example

A Petit Koka program using a closure with mutable state:

```koka
fun getnum()
    var x := 0
    fn () { x := x + 1; x }

fun main()
    val f = getnum()
    repeat(10)
        println(f())
```

This example exercises several parts of the compiler simultaneously:
mutable variables, free-variable analysis, closure construction, mutation
through a captured reference, and code generation.

## Technologies

**OCaml** · **Menhir** · **x86-64 Assembly** · **Make**
