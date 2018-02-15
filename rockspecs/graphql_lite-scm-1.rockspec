package = 'graphql_lite'
version = 'scm-1'

source = {
  url = 'git://github.com/tarantool/graphql-lite.git'
}

description = {
  summary = 'Lua GraphQL implementation',
  homepage = 'https://github.com/tarantool/graphql-lite',
  maintainer = 'Konstantin Nazarov <mail@kn.am>',
  license = 'MIT'
}

dependencies = {
  'lua >= 5.1',
  'lulpeg'
}

build = {
  type = 'builtin',
  modules = {
    ['graphql_lite.parse'] = 'graphql_lite/parse.lua',
    ['graphql_lite.types'] = 'graphql_lite/types.lua',
    ['graphql_lite.schema'] = 'graphql_lite/schema.lua',
    ['graphql_lite.validate'] = 'graphql_lite/validate.lua',
    ['graphql_lite.rules'] = 'graphql_lite/rules.lua',
    ['graphql_lite.execute'] = 'graphql_lite/execute.lua',
    ['graphql_lite.util'] = 'graphql_lite/util.lua'
  }
}
