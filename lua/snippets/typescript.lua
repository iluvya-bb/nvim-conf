local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- TypeScript Interface
	s(
		"int",
		fmt(
			[[
interface {} {{
  {}
}}
]],
			{
				i(1, "InterfaceName"),
				i(2, ""),
			}
		)
	),

	-- TypeScript Type
	s(
		"type",
		fmt(
			[[
type {} = {};
]],
			{
				i(1, "TypeName"),
				i(2, ""),
			}
		)
	),

	-- TypeScript Enum
	s(
		"enum",
		fmt(
			[[
enum {} {{
  {}
}}
]],
			{
				i(1, "EnumName"),
				i(2, ""),
			}
		)
	),

	-- TypeScript Generic Function
	s(
		"gf",
		fmt(
			[[
function {}<T>({}: T): {} {{
  {}
}}
]],
			{
				i(1, "functionName"),
				i(2, "param"),
				i(3, "T"),
				i(4, ""),
			}
		)
	),

	-- TypeScript Class
	s(
		"class",
		fmt(
			[[
class {} {{
  constructor({}) {{
    {}
  }}

  {}
}}
]],
			{
				i(1, "ClassName"),
				i(2, ""),
				i(3, ""),
				i(4, ""),
			}
		)
	),

	-- Generic Type
	s(
		"gen",
		fmt(
			[[
type {}<T> = {{
  {}
}};
]],
			{
				i(1, "TypeName"),
				i(2, ""),
			}
		)
	),

	-- Utility Type - Partial
	s("partial", fmt("Partial<{}>", { i(1, "Type") })),

	-- Utility Type - Required
	s("required", fmt("Required<{}>", { i(1, "Type") })),

	-- Utility Type - Readonly
	s("readonly", fmt("Readonly<{}>", { i(1, "Type") })),

	-- Utility Type - Pick
	s(
		"pick",
		fmt("Pick<{}, '{}'>", {
			i(1, "Type"),
			i(2, "key"),
		})
	),

	-- Utility Type - Omit
	s(
		"omit",
		fmt("Omit<{}, '{}'>", {
			i(1, "Type"),
			i(2, "key"),
		})
	),

	-- Utility Type - Record
	s(
		"record",
		fmt("Record<{}, {}>", {
			i(1, "string"),
			i(2, "any"),
		})
	),

	-- Union Type
	s(
		"union",
		fmt("type {} = {} | {};", {
			i(1, "UnionType"),
			i(2, "TypeA"),
			i(3, "TypeB"),
		})
	),

	-- Intersection Type
	s(
		"inter",
		fmt("type {} = {} & {};", {
			i(1, "IntersectionType"),
			i(2, "TypeA"),
			i(3, "TypeB"),
		})
	),

	-- Type Guard
	s(
		"guard",
		fmt(
			[[
function is{}(value: unknown): value is {} {{
  {}
}}
]],
			{
				i(1, "Type"),
				f(function(args)
					return args[1][1]
				end, { 1 }),
				i(2, "return true;"),
			}
		)
	),

	-- Async Function with Types
	s(
		"aft",
		fmt(
			[[
async function {}({}): Promise<{}> {{
  {}
}}
]],
			{
				i(1, "functionName"),
				i(2, ""),
				i(3, "void"),
				i(4, ""),
			}
		)
	),

	-- Arrow Function with Types
	s(
		"arrt",
		fmt(
			[[
const {}: ({}) => {} = ({}) => {{
  {}
}};
]],
			{
				i(1, "functionName"),
				i(2, ""),
				i(3, "void"),
				f(function(args)
					return args[1][1]
				end, { 2 }),
				i(4, ""),
			}
		)
	),

	-- Namespace
	s(
		"namespace",
		fmt(
			[[
namespace {} {{
  {}
}}
]],
			{
				i(1, "NamespaceName"),
				i(2, ""),
			}
		)
	),

	-- Module Declaration
	s(
		"module",
		fmt(
			[[
declare module '{}' {{
  {}
}}
]],
			{
				i(1, "module-name"),
				i(2, ""),
			}
		)
	),

	-- Abstract Class
	s(
		"abstract",
		fmt(
			[[
abstract class {} {{
  abstract {}(): {};

  {}() {{
    {}
  }}
}}
]],
			{
				i(1, "AbstractClass"),
				i(2, "abstractMethod"),
				i(3, "void"),
				i(4, "concreteMethod"),
				i(5, ""),
			}
		)
	),

	-- Interface Extends
	s(
		"intex",
		fmt(
			[[
interface {} extends {} {{
  {}
}}
]],
			{
				i(1, "InterfaceName"),
				i(2, "BaseInterface"),
				i(3, ""),
			}
		)
	),

	-- Type Alias with Union
	s(
		"tunion",
		fmt(
			[[
type {} =
  | {}
  | {};
]],
			{
				i(1, "TypeName"),
				i(2, "TypeA"),
				i(3, "TypeB"),
			}
		)
	),

	-- Const Assertion
	s("const", t("as const")),

	-- Non-null Assertion
	s("nn", t("!")),

	-- Optional Chaining
	s("opt", t("?.")),

	-- Nullish Coalescing
	s("null", t("??")),

	-- Decorator
	s(
		"dec",
		fmt(
			[[
function {}({}): MethodDecorator {{
  return function (target, propertyKey, descriptor) {{
    {}
  }};
}}
]],
			{
				i(1, "decoratorName"),
				i(2, ""),
				i(3, ""),
			}
		)
	),

	-- Property Decorator
	s(
		"propdec",
		fmt(
			[[
function {}({}): PropertyDecorator {{
  return function (target, propertyKey) {{
    {}
  }};
}}
]],
			{
				i(1, "decoratorName"),
				i(2, ""),
				i(3, ""),
			}
		)
	),

	-- Readonly Property
	s(
		"readprop",
		fmt(
			[[
readonly {}: {};
]],
			{
				i(1, "propertyName"),
				i(2, "Type"),
			}
		)
	),

	-- Private Property
	s(
		"private",
		fmt(
			[[
private {}: {};
]],
			{
				i(1, "propertyName"),
				i(2, "Type"),
			}
		)
	),

	-- Public Property
	s(
		"public",
		fmt(
			[[
public {}: {};
]],
			{
				i(1, "propertyName"),
				i(2, "Type"),
			}
		)
	),

	-- Protected Property
	s(
		"protected",
		fmt(
			[[
protected {}: {};
]],
			{
				i(1, "propertyName"),
				i(2, "Type"),
			}
		)
	),

	-- Static Method
	s(
		"static",
		fmt(
			[[
static {}({}): {} {{
  {}
}}
]],
			{
				i(1, "methodName"),
				i(2, ""),
				i(3, "void"),
				i(4, ""),
			}
		)
	),

	-- Getter
	s(
		"get",
		fmt(
			[[
get {}(): {} {{
  {}
}}
]],
			{
				i(1, "propertyName"),
				i(2, "Type"),
				i(3, "return this._value;"),
			}
		)
	),

	-- Setter
	s(
		"set",
		fmt(
			[[
set {}(value: {}) {{
  {}
}}
]],
			{
				i(1, "propertyName"),
				i(2, "Type"),
				i(3, "this._value = value;"),
			}
		)
	),

	-- Index Signature
	s(
		"index",
		fmt(
			[[
[key: {}]: {};
]],
			{
				i(1, "string"),
				i(2, "any"),
			}
		)
	),

	-- Conditional Type
	s(
		"cond",
		fmt(
			[[
type {} = {} extends {} ? {} : {};
]],
			{
				i(1, "ConditionalType"),
				i(2, "T"),
				i(3, "Condition"),
				i(4, "TrueType"),
				i(5, "FalseType"),
			}
		)
	),

	-- Mapped Type
	s(
		"mapped",
		fmt(
			[[
type {}<T> = {{
  [P in keyof T]: {};
}};
]],
			{
				i(1, "MappedType"),
				i(2, "T[P]"),
			}
		)
	),

	-- Template Literal Type (FIXED HERE)
	s(
		"template",
		fmt(
			[[
type {} = `{}${"{}"}`{};
]],
			{
				i(1, "TemplateType"),
				i(2, "prefix-"),
				i(3, "string"),
				i(4, ""),
			}
		)
	),

	-- Infer Type
	s(
		"infer",
		fmt(
			[[
type {} = T extends {}infer {} ? {} : {};
]],
			{
				i(1, "InferType"),
				i(2, ""),
				i(3, "U"),
				f(function(args)
					return args[1][1]
				end, { 3 }),
				i(4, "never"),
			}
		)
	),

	-- keyof Type
	s("keyof", fmt("keyof {}", { i(1, "Type") })),

	-- typeof Type
	s("typeof", fmt("typeof {}", { i(1, "value") })),

	-- ReturnType
	s("returntype", fmt("ReturnType<typeof {}>", { i(1, "func") })),

	-- Parameters Type
	s("params", fmt("Parameters<typeof {}>", { i(1, "func") })),
}
