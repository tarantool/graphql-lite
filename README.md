# GraphQL Lua


Lua implementation of GraphQL for Tarantool.

## Installation

tarantoolctl rocks install graphql_lite

## Example

```lua
local parse = require 'graphql_lite.parse'
local schema = require 'graphql_lite.schema'
local types = require 'graphql_lite.types'
local validate = require 'graphql_lite.validate'
local execute = require 'graphql_lite.execute'

-- Parse a query
local ast = parse [[
query getUser($id: ID) {
  person(id: $id) {
    firstName
    lastName
  }
}
]]

-- Create a type
local Person = types.object {
  name = 'Person',
  fields = {
    id = types.id.nonNull,
    firstName = types.string.nonNull,
    middleName = types.string,
    lastName = types.string.nonNull,
    age = types.int.nonNull
  }
}

-- Create a schema
local schema = schema.create {
  query = types.object {
    name = 'Query',
    fields = {
      person = {
        kind = Person,
        arguments = {
          id = types.id
        },
        resolve = function(rootValue, arguments)
          if arguments.id ~= 1 then return nil end

          return {
            id = 1,
            firstName = 'Bob',
            lastName = 'Ross',
            age = 52
          }
        end
      }
    }
  }
}

-- Validate a parsed query against a schema
validate(schema, ast)

-- Execution
local rootValue = {}
local variables = { id = 1 }
local operationName = 'getUser'

execute(schema, ast, rootValue, variables, operationName)

--[[
{
  person = {
    firstName = 'Bob',
    lastName = 'Ross'
  }
}
]]
```

## Status

- [x] Parsing
  - [ ] Improve error messages
- [x] Type system
- [x] Introspection
- [x] Validation
- [x] Execution
  - [ ] Asynchronous execution (coroutines)
- [ ] Example server

## Running tests

```lua
lua tests/runner.lua
```

## License

MIT
