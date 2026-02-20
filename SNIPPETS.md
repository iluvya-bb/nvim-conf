# Custom Code Snippets Reference

This file contains all available custom snippets for React, Node.js, Go, and Rust development.

## How to Use

1. Type the snippet trigger in insert mode
2. Press `Tab` to expand the snippet
3. Use `Tab` and `Shift+Tab` to navigate between placeholders
4. Press `Enter` to confirm completion

---

## JavaScript/TypeScript & React Snippets

### React Components

- **`rfc`** - React Functional Component
- **`rfct`** - React Functional Component with TypeScript
- **`rfcp`** - React FC with Props Interface (TSX only)

### React Hooks

- **`us`** - useState Hook
- **`ue`** - useEffect Hook
- **`uc`** - useContext Hook
- **`ucb`** - useCallback Hook
- **`um`** - useMemo Hook
- **`uref`** - useRef Hook

### Node.js/Express

- **`route`** - Express Route Handler
- **`middleware`** - Express Middleware
- **`af`** - Async/Await Function
- **`prom`** - Promise
- **`tc`** - Try-Catch Block

### HTTP/API

- **`fetch`** - Fetch API GET
- **`fetchpost`** - Fetch API POST
- **`afetch`** - Async Fetch
- **`axget`** - Axios GET
- **`axpost`** - Axios POST

### Advanced React Patterns

- **`hook`** - Custom Hook
- **`ctx`** - Context Provider
- **`errbound`** - Error Boundary
- **`rcc`** - React Class Component

### Testing

- **`test`** - Jest Test
- **`testa`** - Jest Async Test
- **`rtl`** - React Testing Library Test

### Utilities

- **`cl`** - console.log()
- **`ce`** - console.error()
- **`imp`** - Import Statement
- **`imd`** - Import Destructured
- **`exp`** - Export Default
- **`exn`** - Export Named
- **`arr`** - Arrow Function
- **`map`** - Array Map
- **`filter`** - Array Filter
- **`reduce`** - Array Reduce
- **`fe`** - forEach
- **`some`** - Array.some()
- **`every`** - Array.every()
- **`find`** - Array.find()
- **`findi`** - Array.findIndex()

### Timing Functions

- **`sto`** - setTimeout
- **`si`** - setInterval

### Destructuring

- **`dest`** - Object Destructuring
- **`desa`** - Array Destructuring
- **`ter`** - Ternary Operator

### Object/Class

- **`om`** - Object Method
- **`class`** - Class with Constructor
- **`keys`** - Object.keys()
- **`vals`** - Object.values()
- **`entries`** - Object.entries()

### JSON

- **`jstr`** - JSON.stringify()
- **`jpar`** - JSON.parse()

### Storage

- **`lset`** - localStorage.setItem()
- **`lget`** - localStorage.getItem()
- **`sset`** - sessionStorage.setItem()
- **`sget`** - sessionStorage.getItem()

### Express/Node.js

- **`errhandler`** - Express Error Handler
- **`cors`** - CORS Middleware
- **`schema`** - Mongoose Schema

### TypeScript Specific

- **`int`** - Interface
- **`intex`** - Interface Extends
- **`type`** - Type Alias
- **`enum`** - Enum
- **`gf`** - Generic Function
- **`class`** - Class
- **`gen`** - Generic Type
- **`union`** - Union Type
- **`tunion`** - Type Alias with Union
- **`inter`** - Intersection Type
- **`guard`** - Type Guard
- **`aft`** - Async Function with Types
- **`arrt`** - Arrow Function with Types
- **`namespace`** - Namespace
- **`module`** - Module Declaration
- **`abstract`** - Abstract Class

#### Utility Types
- **`partial`** - Partial<Type>
- **`required`** - Required<Type>
- **`readonly`** - Readonly<Type>
- **`pick`** - Pick<Type, Keys>
- **`omit`** - Omit<Type, Keys>
- **`record`** - Record<Key, Value>
- **`returntype`** - ReturnType<typeof func>
- **`params`** - Parameters<typeof func>

#### Class Members
- **`private`** - Private Property
- **`public`** - Public Property
- **`protected`** - Protected Property
- **`readprop`** - Readonly Property
- **`static`** - Static Method
- **`get`** - Getter
- **`set`** - Setter

#### Advanced Types
- **`cond`** - Conditional Type
- **`mapped`** - Mapped Type
- **`template`** - Template Literal Type
- **`infer`** - Infer Type
- **`keyof`** - keyof Type
- **`typeof`** - typeof Type
- **`index`** - Index Signature

#### Decorators
- **`dec`** - Method Decorator
- **`propdec`** - Property Decorator

#### Operators
- **`const`** - As Const
- **`nn`** - Non-null Assertion (!)
- **`opt`** - Optional Chaining (?.)
- **`null`** - Nullish Coalescing (??)

---

## Go Snippets

### Basic

- **`main`** - Main Function
- **`fn`** - Function
- **`fne`** - Function with Error Return
- **`meth`** - Method
- **`str`** - Struct
- **`int`** - Interface

### Error Handling

- **`iferr`** - If Error Check
- **`err`** - Error Return

### Control Flow

- **`for`** - For Loop
- **`forr`** - For Range Loop
- **`sw`** - Switch Statement
- **`sel`** - Select Statement
- **`def`** - Defer Statement

### HTTP

- **`handler`** - HTTP Handler
- **`server`** - HTTP Server

### Concurrency

- **`go`** - Goroutine
- **`ch`** - Channel

### Testing

- **`test`** - Test Function
- **`tt`** - Table-Driven Test

### HTTP Utilities

- **`jsonres`** - HTTP JSON Response
- **`httperr`** - HTTP Error Response
- **`parsejson`** - Parse JSON Request
- **`middleware`** - HTTP Middleware
- **`httpserver`** - HTTP Server with Router
- **`httpget`** - HTTP Get Request
- **`httppost`** - HTTP Post Request

### Context

- **`ctxtimeout`** - Context with Timeout
- **`ctxcancel`** - Context with Cancel
- **`ctxdeadline`** - Context with Deadline

### Database (SQL)

- **`sqlquery`** - SQL Query with Rows
- **`sqlrow`** - SQL QueryRow
- **`sqlexec`** - SQL Exec

### File Operations

- **`readfile`** - Read File
- **`writefile`** - Write File
- **`openfile`** - Open File
- **`createfile`** - Create File

### Concurrency

- **`wg`** - WaitGroup
- **`mutex`** - Mutex Lock/Unlock
- **`rwmutex`** - RWMutex Read Lock

### Logging & Error Handling

- **`log`** - Logger
- **`recover`** - Panic Recovery
- **`errwrap`** - Error Wrap
- **`errtype`** - Custom Error Type

### Time

- **`timeparse`** - Time Parse
- **`timefmt`** - Time Format

### JSON

- **`jmarshal`** - JSON Marshal
- **`junmarshal`** - JSON Unmarshal

### Utilities

- **`json`** - JSON Struct Tags
- **`p`** - fmt.Println
- **`pf`** - fmt.Printf
- **`spf`** - fmt.Sprintf
- **`make`** - Make Slice
- **`app`** - Append to Slice
- **`flag`** - Command Line Flag
- **`bench`** - Benchmark Function

---

## Rust Snippets

### Basic

- **`main`** - Main Function
- **`fn`** - Function
- **`pfn`** - Public Function
- **`afn`** - Async Function

### Data Types

- **`str`** - Struct
- **`pstr`** - Public Struct
- **`dstr`** - Struct with Derive
- **`enum`** - Enum
- **`penum`** - Public Enum

### Implementations

- **`impl`** - Impl Block
- **`implt`** - Impl Trait
- **`new`** - New Constructor
- **`trait`** - Trait
- **`ptrait`** - Public Trait

### Control Flow

- **`match`** - Match Statement
- **`ifl`** - If Let
- **`for`** - For Loop
- **`while`** - While Loop
- **`loop`** - Loop

### Error Handling

- **`res`** - Result Return Type
- **`opt`** - Option Return Type
- **`?`** - Unwrap or Return (?)
- **`uw`** - Unwrap
- **`exp`** - Expect

### Testing

- **`test`** - Test Function
- **`testmod`** - Test Module
- **`ass`** - Assert Equal

### Option & Result Patterns

- **`optmap`** - Option.map()
- **`optand`** - Option.and_then()
- **`optunwrap`** - Option.unwrap_or()
- **`optelse`** - Option.unwrap_or_else()
- **`resmap`** - Result.map()
- **`resmapmerr`** - Result.map_err()
- **`resand`** - Result.and_then()

### Iterators

- **`itermap`** - Iterator Map
- **`iterfilter`** - Iterator Filter
- **`iterfold`** - Iterator Fold
- **`iterfind`** - Iterator Find
- **`iterany`** - Iterator Any
- **`iterall`** - Iterator All

### File Operations

- **`readfile`** - Read File to String
- **`writefile`** - Write File
- **`fileopen`** - File Open
- **`filecreate`** - File Create
- **`bufreader`** - BufReader with Lines

### HTTP (reqwest)

- **`reqget`** - HTTP Get Request
- **`reqpost`** - HTTP Post Request

### Actix Web

- **`actix`** - Actix Web Handler
- **`actixserver`** - Actix Web Server

### Advanced Async

- **`tselect`** - tokio::select!
- **`async`** - Async Block
- **`aw`** - .await

### Concurrency

- **`channel`** - mpsc Channel
- **`thread`** - Thread Spawn

### Design Patterns

- **`builder`** - Builder Pattern
- **`from`** - From Trait Implementation
- **`display`** - Display Trait Implementation
- **`errimpl`** - Error Trait Implementation

### Serialization

- **`serde`** - Serde Struct

### Static & Lazy

- **`lazy`** - Lazy Static
- **`once`** - Once Cell

### Macros

- **`macro`** - Macro Rules

### Database

- **`sqlxquery`** - sqlx Query
- **`sqlxexec`** - sqlx Execute
- **`diesel`** - Diesel Query

### Error Handling Libraries

- **`anyhow`** - anyhow Result
- **`thiserr`** - thiserror Error

### Utilities

- **`p`** - println!()
- **`pv`** - println! with Variable
- **`pd`** - Debug println!
- **`pp`** - Pretty Debug println!
- **`vec`** - Vector
- **`map`** - HashMap
- **`cl`** - Clone
- **`ts`** - to_string()
- **`to`** - to_owned()
- **`mod`** - Module
- **`use`** - Use Statement
- **`lifetime`** - Lifetime Annotation
- **`where`** - Where Clause

### Smart Pointers & Concurrency

- **`box`** - Box::new()
- **`rc`** - Rc::new()
- **`arc`** - Arc::new()
- **`mutex`** - Mutex::new()

### Async (Tokio)

- **`spawn`** - tokio::spawn
- **`tmain`** - Tokio Main Function

### Attributes

- **`allow`** - Allow Dead Code
- **`der`** - Derive

---

## Tips

- Most snippets have multiple tab stops - keep pressing `Tab` to move through them
- Some snippets auto-generate content based on your input (like component names)
- TypeScript React files (.tsx) have access to all JavaScript, TypeScript, and React snippets
- Snippets are context-aware and only appear in their respective file types

## Customization

To add or modify snippets, edit the files in `~/.config/nvim/lua/snippets/`:
- `javascript.lua` - JavaScript and React snippets
- `typescript.lua` - TypeScript-specific snippets
- `typescriptreact.lua` - TSX-specific snippets
- `go.lua` - Go snippets
- `rust.lua` - Rust snippets

After making changes, restart Neovim or run `:source %` in the config file.
