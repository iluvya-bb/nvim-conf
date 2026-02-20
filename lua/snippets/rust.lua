local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Main Function
    s("main", fmt([[
fn main() {{
    {}
}}
]], {
        i(1, ""),
    })),

    -- Function
    s("fn", fmt([[
fn {}({}) -> {} {{
    {}
}}
]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "()"),
        i(4, ""),
    })),

    -- Public Function
    s("pfn", fmt([[
pub fn {}({}) -> {} {{
    {}
}}
]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "()"),
        i(4, ""),
    })),

    -- Async Function
    s("afn", fmt([[
async fn {}({}) -> {} {{
    {}
}}
]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "()"),
        i(4, ""),
    })),

    -- Struct
    s("str", fmt([[
struct {} {{
    {}
}}
]], {
        i(1, "StructName"),
        i(2, ""),
    })),

    -- Public Struct
    s("pstr", fmt([[
pub struct {} {{
    {}
}}
]], {
        i(1, "StructName"),
        i(2, ""),
    })),

    -- Derive Struct
    s("dstr", fmt([[
#[derive({})]
struct {} {{
    {}
}}
]], {
        i(1, "Debug, Clone"),
        i(2, "StructName"),
        i(3, ""),
    })),

    -- Enum
    s("enum", fmt([[
enum {} {{
    {}
}}
]], {
        i(1, "EnumName"),
        i(2, ""),
    })),

    -- Public Enum
    s("penum", fmt([[
pub enum {} {{
    {}
}}
]], {
        i(1, "EnumName"),
        i(2, ""),
    })),

    -- Impl Block
    s("impl", fmt([[
impl {} {{
    {}
}}
]], {
        i(1, "Type"),
        i(2, ""),
    })),

    -- Impl Trait
    s("implt", fmt([[
impl {} for {} {{
    {}
}}
]], {
        i(1, "Trait"),
        i(2, "Type"),
        i(3, ""),
    })),

    -- New Constructor
    s("new", fmt([[
pub fn new({}) -> Self {{
    Self {{
        {}
    }}
}}
]], {
        i(1, ""),
        i(2, ""),
    })),

    -- Match Statement
    s("match", fmt([[
match {} {{
    {} => {{}},
    _ => {{}},
}}
]], {
        i(1, "expression"),
        i(2, "pattern"),
    })),

    -- If Let
    s("ifl", fmt([[
if let {} = {} {{
    {}
}}
]], {
        i(1, "Some(x)"),
        i(2, "value"),
        i(3, ""),
    })),

    -- Result Return
    s("res", fmt([[
fn {}({}) -> Result<{}, {}> {{
    {}
}}
]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "T"),
        i(4, "Error"),
        i(5, ""),
    })),

    -- Option Return
    s("opt", fmt([[
fn {}({}) -> Option<{}> {{
    {}
}}
]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "T"),
        i(4, ""),
    })),

    -- Unwrap or Return
    s("?", t("?")),

    -- Unwrap
    s("uw", t(".unwrap()")),

    -- Expect
    s("exp", fmt('.expect("{}")', { i(1, "message") })),

    -- For Loop
    s("for", fmt([[
for {} in {} {{
    {}
}}
]], {
        i(1, "item"),
        i(2, "iterator"),
        i(3, ""),
    })),

    -- While Loop
    s("while", fmt([[
while {} {{
    {}
}}
]], {
        i(1, "condition"),
        i(2, ""),
    })),

    -- Loop
    s("loop", fmt([[
loop {{
    {}
}}
]], {
        i(1, ""),
    })),

    -- Trait
    s("trait", fmt([[
trait {} {{
    {}
}}
]], {
        i(1, "TraitName"),
        i(2, ""),
    })),

    -- Public Trait
    s("ptrait", fmt([[
pub trait {} {{
    {}
}}
]], {
        i(1, "TraitName"),
        i(2, ""),
    })),

    -- Test Function
    s("test", fmt([[
#[test]
fn {}() {{
    {}
}}
]], {
        i(1, "test_name"),
        i(2, ""),
    })),

    -- Test Module
    s("testmod", fmt([[
#[cfg(test)]
mod tests {{
    use super::*;

    #[test]
    fn {}() {{
        {}
    }}
}}
]], {
        i(1, "test_name"),
        i(2, ""),
    })),

    -- Assert
    s("ass", fmt("assert_eq!({}, {});", {
        i(1, "left"),
        i(2, "right"),
    })),

    -- Println
    s("p", fmt('println!("{}");', { i(1, "") })),

    -- Println with Variable
    s("pv", fmt('println!("{{}}", {});', { i(1, "var") })),

    -- Debug Println
    s("pd", fmt('println!("{{:?}}", {});', { i(1, "var") })),

    -- Pretty Debug Println
    s("pp", fmt('println!("{{:#?}}", {});', { i(1, "var") })),

    -- Vector
    s("vec", fmt("vec![{}]", { i(1, "") })),

    -- HashMap
    s("map", fmt([[
let mut {} = HashMap::new();
]], {
        i(1, "map"),
    })),

    -- Clone
    s("cl", t(".clone()")),

    -- To String
    s("ts", t(".to_string()")),

    -- To Owned
    s("to", t(".to_owned()")),

    -- Module
    s("mod", fmt([[
mod {} {{
    {}
}}
]], {
        i(1, "module_name"),
        i(2, ""),
    })),

    -- Use Statement
    s("use", fmt("use {};", { i(1, "") })),

    -- Allow Dead Code
    s("allow", t("#[allow(dead_code)]")),

    -- Derive
    s("der", fmt("#[derive({})]", { i(1, "Debug") })),

    -- Closure
    s("cl", fmt("|{}| {}", {
        i(1, ""),
        i(2, ""),
    })),

    -- Box
    s("box", fmt("Box::new({})", { i(1, "") })),

    -- Rc
    s("rc", fmt("Rc::new({})", { i(1, "") })),

    -- Arc
    s("arc", fmt("Arc::new({})", { i(1, "") })),

    -- Mutex
    s("mutex", fmt("Mutex::new({})", { i(1, "") })),

    -- Tokio Spawn
    s("spawn", fmt([[
tokio::spawn(async move {{
    {}
}});
]], {
        i(1, ""),
    })),

    -- Tokio Main
    s("tmain", fmt([[
#[tokio::main]
async fn main() {{
    {}
}}
]], {
        i(1, ""),
    })),

    -- Serde Serialize/Deserialize
    s("serde", fmt([[
#[derive(Debug, Clone, Serialize, Deserialize)]
struct {} {{
    {}
}}
]], {
        i(1, "StructName"),
        i(2, ""),
    })),

    -- Option Map
    s("optmap", fmt([[
{}.map(|{}| {})
]], {
        i(1, "option"),
        i(2, "x"),
        i(3, "x"),
    })),

    -- Option And Then
    s("optand", fmt([[
{}.and_then(|{}| {})
]], {
        i(1, "option"),
        i(2, "x"),
        i(3, "Some(x)"),
    })),

    -- Option Unwrap Or
    s("optunwrap", fmt([[
{}.unwrap_or({})
]], {
        i(1, "option"),
        i(2, "default"),
    })),

    -- Option Unwrap Or Else
    s("optelse", fmt([[
{}.unwrap_or_else(|| {})
]], {
        i(1, "option"),
        i(2, "default_value"),
    })),

    -- Result Map
    s("resmap", fmt([[
{}.map(|{}| {})
]], {
        i(1, "result"),
        i(2, "x"),
        i(3, "x"),
    })),

    -- Result Map Err
    s("resmapmerr", fmt([[
{}.map_err(|e| {})
]], {
        i(1, "result"),
        i(2, "e"),
    })),

    -- Result And Then
    s("resand", fmt([[
{}.and_then(|{}| {})
]], {
        i(1, "result"),
        i(2, "x"),
        i(3, "Ok(x)"),
    })),

    -- Iterator Map
    s("itermap", fmt([[
{}.iter().map(|{}| {}).collect()
]], {
        i(1, "collection"),
        i(2, "x"),
        i(3, "x"),
    })),

    -- Iterator Filter
    s("iterfilter", fmt([[
{}.iter().filter(|{}| {}).collect()
]], {
        i(1, "collection"),
        i(2, "x"),
        i(3, "true"),
    })),

    -- Iterator Fold
    s("iterfold", fmt([[
{}.iter().fold({}, |acc, {}| {{
    {}
}})
]], {
        i(1, "collection"),
        i(2, "0"),
        i(3, "x"),
        i(4, "acc"),
    })),

    -- Iterator Find
    s("iterfind", fmt([[
{}.iter().find(|{}| {})
]], {
        i(1, "collection"),
        i(2, "x"),
        i(3, "true"),
    })),

    -- Iterator Any
    s("iterany", fmt([[
{}.iter().any(|{}| {})
]], {
        i(1, "collection"),
        i(2, "x"),
        i(3, "true"),
    })),

    -- Iterator All
    s("iterall", fmt([[
{}.iter().all(|{}| {})
]], {
        i(1, "collection"),
        i(2, "x"),
        i(3, "true"),
    })),

    -- Read File
    s("readfile", fmt([[
let {} = std::fs::read_to_string("{}")?;
]], {
        i(1, "contents"),
        i(2, "file.txt"),
    })),

    -- Write File
    s("writefile", fmt([[
std::fs::write("{}", {})?;
]], {
        i(1, "file.txt"),
        i(2, "contents"),
    })),

    -- File Open
    s("fileopen", fmt([[
let mut file = File::open("{}")?;
]], {
        i(1, "file.txt"),
    })),

    -- File Create
    s("filecreate", fmt([[
let mut file = File::create("{}")?;
]], {
        i(1, "file.txt"),
    })),

    -- BufReader
    s("bufreader", fmt([[
let file = File::open("{}")?;
let reader = BufReader::new(file);
for line in reader.lines() {{
    let line = line?;
    {}
}}
]], {
        i(1, "file.txt"),
        i(2, ""),
    })),

    -- HTTP Client (reqwest)
    s("reqget", fmt([[
let response = reqwest::get("{}").await?;
let body = response.text().await?;
]], {
        i(1, "url"),
    })),

    -- HTTP Post (reqwest)
    s("reqpost", fmt([[
let client = reqwest::Client::new();
let response = client
    .post("{}")
    .json(&{})
    .send()
    .await?;
]], {
        i(1, "url"),
        i(2, "data"),
    })),

    -- Actix Web Handler
    s("actix", fmt([[
#[get("{}")]
async fn {}({}: web::Json<{}>) -> impl Responder {{
    {}
    HttpResponse::Ok().json({})
}}
]], {
        i(1, "/path"),
        i(2, "handler_name"),
        i(3, "data"),
        i(4, "DataType"),
        i(5, ""),
        i(6, "response"),
    })),

    -- Actix Web Server
    s("actixserver", fmt([[
#[actix_web::main]
async fn main() -> std::io::Result<()> {{
    HttpServer::new(|| {{
        App::new()
            .service({})
    }})
    .bind(("127.0.0.1", {}))?
    .run()
    .await
}}
]], {
        i(1, "handler"),
        i(2, "8080"),
    })),

    -- Tokio Select
    s("tselect", fmt([[
tokio::select! {{
    {} = {} => {{
        {}
    }}
    {} = {} => {{
        {}
    }}
}}
]], {
        i(1, "result"),
        i(2, "future1"),
        i(3, ""),
        i(4, "result2"),
        i(5, "future2"),
        i(6, ""),
    })),

    -- Async Block
    s("async", fmt([[
async {{
    {}
}}
]], {
        i(1, ""),
    })),

    -- Await
    s("aw", t(".await")),

    -- Channel (mpsc)
    s("channel", fmt([[
let ({}, {}) = mpsc::channel();
]], {
        i(1, "tx"),
        i(2, "rx"),
    })),

    -- Thread Spawn
    s("thread", fmt([[
let handle = thread::spawn(|| {{
    {}
}});
handle.join().unwrap();
]], {
        i(1, ""),
    })),

    -- Builder Pattern
    s("builder", fmt([[
impl {} {{
    pub fn builder() -> {}Builder {{
        {}Builder::default()
    }}
}}

#[derive(Default)]
pub struct {}Builder {{
    {}
}}

impl {}Builder {{
    pub fn {}(mut self, {}: {}) -> Self {{
        self.{} = {};
        self
    }}

    pub fn build(self) -> {} {{
        {} {{
            {}
        }}
    }}
}}
]], {
        i(1, "StructName"),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(2, "field: Option<Type>"),
        f(function(args) return args[1][1] end, {1}),
        i(3, "field"),
        f(function(args) return args[1][1] end, {3}),
        i(4, "Type"),
        f(function(args) return args[1][1] end, {3}),
        f(function(args) return args[1][1] end, {3}),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(5, ""),
    })),

    -- From Implementation
    s("from", fmt([[
impl From<{}> for {} {{
    fn from({}: {}) -> Self {{
        {}
    }}
}}
]], {
        i(1, "SourceType"),
        i(2, "TargetType"),
        i(3, "value"),
        f(function(args) return args[1][1] end, {1}),
        i(4, ""),
    })),

    -- Display Implementation
    s("display", fmt([[
impl std::fmt::Display for {} {{
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {{
        write!(f, "{}", {})
    }}
}}
]], {
        i(1, "Type"),
        i(2, "{}"),
        i(3, "self"),
    })),

    -- Error Implementation
    s("errimpl", fmt([[
impl std::error::Error for {} {{
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {{
        {}
    }}
}}
]], {
        i(1, "ErrorType"),
        i(2, "None"),
    })),

    -- Lazy Static
    s("lazy", fmt([[
lazy_static! {{
    static ref {}: {} = {};
}}
]], {
        i(1, "NAME"),
        i(2, "Type"),
        i(3, "value"),
    })),

    -- Once Cell
    s("once", fmt([[
static {}: OnceLock<{}> = OnceLock::new();
]], {
        i(1, "INSTANCE"),
        i(2, "Type"),
    })),

    -- Macro Rules
    s("macro", fmt([[
macro_rules! {} {{
    ({}) => {{
        {}
    }};
}}
]], {
        i(1, "macro_name"),
        i(2, "$($arg:expr),*"),
        i(3, ""),
    })),

    -- SQL Query (sqlx)
    s("sqlxquery", fmt([[
let rows = sqlx::query!("{}")
    .fetch_all(&pool)
    .await?;
]], {
        i(1, "SELECT * FROM table"),
    })),

    -- SQL Execute (sqlx)
    s("sqlxexec", fmt([[
sqlx::query!("{}", {})
    .execute(&pool)
    .await?;
]], {
        i(1, "INSERT INTO table (col) VALUES (?)"),
        i(2, "value"),
    })),

    -- Diesel Query
    s("diesel", fmt([[
use schema::{}::dsl::*;
let results = {}
    .load::<{}>(&mut conn)?;
]], {
        i(1, "table"),
        f(function(args) return args[1][1] end, {1}),
        i(2, "Model"),
    })),

    -- anyhow Result
    s("anyhow", fmt([[
use anyhow::{{Result, Context}};

fn {}() -> Result<{}> {{
    {}
}}
]], {
        i(1, "function_name"),
        i(2, "()"),
        i(3, "Ok(())"),
    })),

    -- thiserror
    s("thiserr", fmt([[
#[derive(Debug, thiserror::Error)]
pub enum {} {{
    #[error("{}")]
    {}(#[from] {}),
}}
]], {
        i(1, "Error"),
        i(2, "error description"),
        i(3, "Variant"),
        i(4, "std::io::Error"),
    })),

    -- Lifetime
    s("lifetime", fmt("'{}",{ i(1, "a") })),

    -- Generic Constraint
    s("where", fmt([[
where
    {}: {},
]], {
        i(1, "T"),
        i(2, "Trait"),
    })),
}
