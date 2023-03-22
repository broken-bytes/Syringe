<p align="center">
  <img src="https://github.com/broken-bytes/syringe/blob/main/syringe_logo.png" width="33%"/>
</p>

# Syringe
![Build](https://github.com/broken-bytes/syringe/actions/workflows/swift.yml/badge.svg) ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/broken-bytes/syringe?label=Version) ![Swift](https://img.shields.io/badge/Swift-5.7-brightgreen) [![Discord](https://dcbadge.vercel.app/api/server/hZqQBWTAkV?style=flat-square)](https://discord.gg/hZqQBWTAkV)

# Getting Started

## Initialising Syringe
Syringe's core is the `Container`. It is the central touchpoint for all interactions with Syringe.

There are two types of `Container`:
- An ordinary `Container`
- A global scope `Container`

Creating a global scope `Container` is the preferred way as it enables the use of the free DSL functions Syringe provides.

Creating a global scope `Container`:
```swift
import Syringe

class DependencyHandler {
    init() {
        injectSyringe {
            modules {
                // Modules go here
            }
        }
    }
}
```

## Creating Modules

Modules are dependency lists in Syringe. 
Defining a module is simple:

```swift
let appModule = module {
    // Dependencies go here
}
```

## Adding Dependencies
Adding dependencies to modules is done via the module DSL:

```swift
let appModule = module {
    singleton { YourType() }
    factory { Int.random(0..<5) }
}
```

## Resolving Dependencies
Resolving dependencies is done via either the module or application DSL:

```swift
class Service {
    let value: Int

    init(value: Int) { 
        self.value = value
    }
}

let appModule = module {
    // Resolving at module level
    singleton { YourType(value: get()) }
    factory { Int.random(0..<5) }
}

class View {
    // Resolving at global level
    let service: Service = get()

    init() {

    }
}
```
