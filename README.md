# Caesar Cipher

A pure Haskell implementation of the Caesar cipher algorithm that rotates characters in the alphabet.

## Project Structure

```
caesar/
├── app/
│   └── Main.hs           # Entry point (Hello world stub)
├── src/
│   └── Lib.hs          # Core library with cipher implementation
├── test/
│   └── Spec.hs        # Test suite
├── caesar.cabal       # Cabal package configuration
├── package.yaml       # hpack configuration
├── stack.yaml        # Stack build configuration
└── LICENSE           # BSD-3-Clause license
```

## Description

This project provides a Caesar cipher implementation in pure Haskell with the following features:

- **Character classification**: Identify lowercase letters, uppercase letters, digits, and misc characters
- **ROT13-style rotation**: Rotate characters within their respective alphabet sets
- **String transformation**: Apply cipher to entire strings

### Available Functions

| Function | Description |
|----------|-------------|
| `caeser offset string` | Encrypt/decrypt a string using Caesar cipher |


## Installation

### Prerequisites

- [Stack](https://docs.haskellstack.org/) - Haskell toolchain

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/prashant-s-n/caesar
   cd caesar
   ```

2. Build the project:
   ```bash
   stack build
   ```

3. Run the executable:
   ```bash
   stack exec caesar-exe
   ```

## Testing

Run tests with:
```bash
stack test
```

## Usage

```haskell
import Lib

-- Encrypt with offset of 3
> caeser 3 "hello"
"khoor"

-- Decrypt by using negative offset
> caesar (-3) "khoor"
"hello"
```