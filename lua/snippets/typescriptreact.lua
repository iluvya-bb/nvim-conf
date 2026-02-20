-- TypeScript React snippets (extends javascript.lua)
local js_snippets = require("snippets.javascript")
local ts_snippets = require("snippets.typescript")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {}

-- Add JavaScript snippets
for _, snip in ipairs(js_snippets) do
    table.insert(snippets, snip)
end

-- Add TypeScript snippets
for _, snip in ipairs(ts_snippets) do
    table.insert(snippets, snip)
end

-- Add TSX-specific snippets
local tsx_snippets = {
    -- React FC with Props Interface
    s("rfcp", fmt([[
import React from 'react';

interface {}Props {{
  {}
}}

export const {}: React.FC<{}Props> = ({{ {} }}) => {{
  return (
    <div>
      {}
    </div>
  );
}};
]], {
        i(1, "ComponentName"),
        i(2, ""),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(3, "props"),
        i(4, ""),
    })),
}

for _, snip in ipairs(tsx_snippets) do
    table.insert(snippets, snip)
end

return snippets
