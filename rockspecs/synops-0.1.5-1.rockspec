package = "synops"
version = "0.1.5-1"
source = {
    url = "gitrec://github.com/mah0x211/lua-synops.git",
    tag = "v0.1.5"
}
description = {
    summary = "coroutine based synchronously non-blocking operations module",
    homepage = "https://github.com/mah0x211/lua-synops",
    license = "MIT/X11",
    maintainer = "Masatoshi Teruya"
}
dependencies = {
    "lua >= 5.1",
    "luarocks-fetch-gitrec >= 0.2",
    "minheap >= 0.1.1",
    "process >= 1.6.1",
    "sentry >= 0.8.0",
}
build = {
    type = "builtin",
    install = {
        bin = {
            synops = "bin/synops.lua"
        }
    },
    modules = {
        synops = "synops.lua",
        ['synops.aux'] = "lib/aux.lua",
        ['synops.aux.fileno'] = {
            incdirs = { "deps/lauxhlib" },
            sources = { "src/aux_fileno.c" }
        },
        ['synops.callee'] = "lib/callee.lua",
        ['synops.coro'] = {
            incdirs = { "deps/lauxhlib" },
            sources = { "src/coro.c" }
        },
        ['synops.event'] = "lib/event.lua",
        ['synops.hrtimer'] = {
            incdirs = { "deps/lauxhlib" },
            sources = { "src/hrtimer.c" }
        },
        ['synops.runq'] = "lib/runq.lua",
        -- Temporary Measures
        -- To avoid module namespace collisions, building the dependent modules
        -- by this rockspec.
        deque = {
            incdirs = {
                "deps/lauxhlib"
            },
            sources = {
                "deps/lua-deque/src/deque.c"
            }
        },
    }
}
