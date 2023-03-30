<p align="center">
  <img src="https://github.com/broken-bytes/syringe/blob/main/syringe_logo.png" width="33%"/>
</p>

# Syringe
![Build](https://github.com/broken-bytes/syringe/actions/workflows/swift.yml/badge.svg) ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/broken-bytes/syringe?label=Version) ![Swift](https://img.shields.io/badge/Swift-5.7-brightgreen) [![Discord](https://dcbadge.vercel.app/api/server/hZqQBWTAkV?style=flat-square)](https://discord.gg/hZqQBWTAkV) 
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=broken-bytes_Syringe&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=broken-bytes_Syringe)

Syringe is a lightweight dependency(DI) framework written in Swift. It aims to provide an intuitive and non-invasive way to realise Inversion of Control(IoC) in applications written in Swift.

Unlike other dependency frameworks, Syringe aims for simplicity and ease-of-use via an extensive custom DSL. 

The core features of Syringe:
- Full-features dependency injection
- Intuitive and clever custom DSL
- Non-invasive:
    - No property wrappers
    - No code-generation
    - Only use Syringe where you need to
- Tested on macOS, Windows and Linux.

## Getting Started

### Setup

Syringe is available via the Swift Package Manager.

Just add it as a dependency:
```
dependencies: [
  ...
  .package(url: "https://github.com/broken-bytes/Syringe", from: "v0.2.1-a"),
]
```

Now Syringe is ready for import:
```swift
import Syringe
```

You can now use Syringe from your code.

### Initialising Syringe
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

### Creating Modules

Modules are dependency lists in Syringe. 
Defining a module is simple:

```swift
let appModule = module {
    // Dependencies go here
}
```

### Adding Dependencies
Adding dependencies to modules is done via the module DSL:

```swift
let appModule = module {
    singleton { _ in YourType() }
    factory { _ in Int.random(0..<5) }
}
```

### Resolving Dependencies
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
    singleton { module in YourType(value: module.get()) }
    factory { _ in Int.random(0..<5) }
}

class View {
    // Resolving at global level
    let service: Service = inject()!

    init() {

    }
}
```

## Documentation

The full documentation can be found under [Documentation](https://broken-bytes.github.io/Syringe/)
