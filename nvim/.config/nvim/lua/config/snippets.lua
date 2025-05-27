local ls = require("luasnip")
local snip = ls.snippet
local txt = ls.text_node
local ins = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("php", {
    snip("php", {
        txt('<?php '),
        ins(1),
        txt(" ?>")
    })
})
