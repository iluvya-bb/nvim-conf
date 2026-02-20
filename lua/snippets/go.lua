local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Main Function
    s("main", fmt([[
package main

import "fmt"

func main() {{
    {}
}}
]], {
        i(1, ""),
    })),

    -- Function
    s("fn", fmt([[
func {}({}) {} {{
    {}
}}
]], {
        i(1, "functionName"),
        i(2, ""),
        i(3, ""),
        i(4, ""),
    })),

    -- Function with Error Return
    s("fne", fmt([[
func {}({}) ({}, error) {{
    {}
    return {}, nil
}}
]], {
        i(1, "functionName"),
        i(2, ""),
        i(3, "result"),
        i(4, ""),
        f(function(args) return args[1][1] end, {3}),
    })),

    -- Method
    s("meth", fmt([[
func ({} *{}) {}({}) {} {{
    {}
}}
]], {
        i(1, "receiver"),
        i(2, "Type"),
        i(3, "methodName"),
        i(4, ""),
        i(5, ""),
        i(6, ""),
    })),

    -- Struct
    s("str", fmt([[
type {} struct {{
    {}
}}
]], {
        i(1, "StructName"),
        i(2, ""),
    })),

    -- Interface
    s("int", fmt([[
type {} interface {{
    {}
}}
]], {
        i(1, "InterfaceName"),
        i(2, ""),
    })),

    -- If Error Check
    s("iferr", fmt([[
if err != nil {{
    {}
}}
]], {
        i(1, "return err"),
    })),

    -- Error Return
    s("err", t("return nil, fmt.Errorf(\"\", )")),

    -- For Loop
    s("for", fmt([[
for {} {{
    {}
}}
]], {
        i(1, ""),
        i(2, ""),
    })),

    -- For Range Loop
    s("forr", fmt([[
for {}, {} := range {} {{
    {}
}}
]], {
        i(1, "i"),
        i(2, "v"),
        i(3, "collection"),
        i(4, ""),
    })),

    -- Switch Statement
    s("sw", fmt([[
switch {} {{
case {}:
    {}
default:
    {}
}}
]], {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
    })),

    -- HTTP Handler
    s("handler", fmt([[
func {}(w http.ResponseWriter, r *http.Request) {{
    {}
}}
]], {
        i(1, "handlerName"),
        i(2, ""),
    })),

    -- HTTP Server
    s("server", fmt([[
http.HandleFunc("{}", {})
log.Fatal(http.ListenAndServe(":{}", nil))
]], {
        i(1, "/"),
        i(2, "handler"),
        i(3, "8080"),
    })),

    -- Goroutine
    s("go", fmt([[
go func() {{
    {}
}}()
]], {
        i(1, ""),
    })),

    -- Channel
    s("ch", fmt([[
{} := make(chan {})
]], {
        i(1, "ch"),
        i(2, "type"),
    })),

    -- Select Statement
    s("sel", fmt([[
select {{
case {} := <-{}:
    {}
case <-time.After({}):
    {}
}}
]], {
        i(1, "v"),
        i(2, "ch"),
        i(3, ""),
        i(4, "time.Second"),
        i(5, ""),
    })),

    -- Defer Statement
    s("def", fmt("defer {}()", { i(1, "func") })),

    -- Test Function
    s("test", fmt([[
func Test{}(t *testing.T) {{
    {}
}}
]], {
        i(1, "FunctionName"),
        i(2, ""),
    })),

    -- Table-Driven Test
    s("tt", fmt([[
func Test{}(t *testing.T) {{
    tests := []struct {{
        name string
        {}
        want {}
    }}{{
        {{
            name: "{}",
            {}
            want: {},
        }},
    }}

    for _, tt := range tests {{
        t.Run(tt.name, func(t *testing.T) {{
            got := {}
            if got != tt.want {{
                t.Errorf("got %v, want %v", got, tt.want)
            }}
        }})
    }}
}}
]], {
        i(1, "FunctionName"),
        i(2, ""),
        i(3, ""),
        i(4, "test case"),
        i(5, ""),
        i(6, ""),
        i(7, ""),
    })),

    -- JSON Struct Tags
    s("json", fmt('`json:"{}"`', { i(1, "") })),

    -- Print
    s("p", fmt('fmt.Println({})', { i(1, "") })),

    -- Printf
    s("pf", fmt('fmt.Printf("{}", {})', {
        i(1, "%v\\n"),
        i(2, ""),
    })),

    -- Make Slice
    s("make", fmt("make([]{}, {})", {
        i(1, "type"),
        i(2, "0"),
    })),

    -- Append
    s("app", fmt("{} = append({}, {})", {
        i(1, "slice"),
        f(function(args) return args[1][1] end, {1}),
        i(2, "element"),
    })),

    -- HTTP JSON Response
    s("jsonres", fmt([[
w.Header().Set("Content-Type", "application/json")
w.WriteHeader(http.Status{})
json.NewEncoder(w).Encode({})
]], {
        i(1, "OK"),
        i(2, "data"),
    })),

    -- HTTP Error Response
    s("httperr", fmt([[
http.Error(w, "{}", http.Status{})
]], {
        i(1, "error message"),
        i(2, "InternalServerError"),
    })),

    -- Parse JSON Request
    s("parsejson", fmt([[
var {} {}
if err := json.NewDecoder(r.Body).Decode(&{}); err != nil {{
    http.Error(w, err.Error(), http.StatusBadRequest)
    return
}}
]], {
        i(1, "data"),
        i(2, "Type"),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- Context with Timeout
    s("ctxtimeout", fmt([[
ctx, cancel := context.WithTimeout(context.Background(), {}*time.Second)
defer cancel()
]], {
        i(1, "5"),
    })),

    -- Context with Cancel
    s("ctxcancel", fmt([[
ctx, cancel := context.WithCancel(context.Background())
defer cancel()
]], {})),

    -- Context with Deadline
    s("ctxdeadline", fmt([[
ctx, cancel := context.WithDeadline(context.Background(), time.Now().Add({}*time.Second))
defer cancel()
]], {
        i(1, "5"),
    })),

    -- SQL Query
    s("sqlquery", fmt([[
rows, err := db.Query("{}", {})
if err != nil {{
    return nil, err
}}
defer rows.Close()

for rows.Next() {{
    var {} {}
    if err := rows.Scan(&{}); err != nil {{
        return nil, err
    }}
    {}
}}
]], {
        i(1, "SELECT * FROM table WHERE id = ?"),
        i(2, "id"),
        i(3, "item"),
        i(4, "Type"),
        f(function(args) return args[1][1] end, {3}),
        i(5, ""),
    })),

    -- SQL QueryRow
    s("sqlrow", fmt([[
var {} {}
err := db.QueryRow("{}", {}).Scan(&{})
if err != nil {{
    return err
}}
]], {
        i(1, "result"),
        i(2, "Type"),
        i(3, "SELECT * FROM table WHERE id = ?"),
        i(4, "id"),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- SQL Exec
    s("sqlexec", fmt([[
result, err := db.Exec("{}", {})
if err != nil {{
    return err
}}
]], {
        i(1, "INSERT INTO table (col) VALUES (?)"),
        i(2, "value"),
    })),

    -- Read File
    s("readfile", fmt([[
data, err := os.ReadFile("{}")
if err != nil {{
    return err
}}
]], {
        i(1, "filename.txt"),
    })),

    -- Write File
    s("writefile", fmt([[
err := os.WriteFile("{}", {}, {})
if err != nil {{
    return err
}}
]], {
        i(1, "filename.txt"),
        i(2, "data"),
        i(3, "0644"),
    })),

    -- Open File
    s("openfile", fmt([[
file, err := os.Open("{}")
if err != nil {{
    return err
}}
defer file.Close()
]], {
        i(1, "filename.txt"),
    })),

    -- Create File
    s("createfile", fmt([[
file, err := os.Create("{}")
if err != nil {{
    return err
}}
defer file.Close()
]], {
        i(1, "filename.txt"),
    })),

    -- Logger
    s("log", fmt([[
log := log.New(os.Stdout, "{}: ", log.Ldate|log.Ltime|log.Lshortfile)
]], {
        i(1, "INFO"),
    })),

    -- Panic Recovery
    s("recover", fmt([[
defer func() {{
    if r := recover(); r != nil {{
        log.Printf("Recovered from panic: %v", r)
        {}
    }}
}}()
]], {
        i(1, ""),
    })),

    -- WaitGroup
    s("wg", fmt([[
var wg sync.WaitGroup
wg.Add({})

go func() {{
    defer wg.Done()
    {}
}}()

wg.Wait()
]], {
        i(1, "1"),
        i(2, ""),
    })),

    -- Mutex Lock
    s("mutex", fmt([[
var mu sync.Mutex
mu.Lock()
{}
mu.Unlock()
]], {
        i(1, ""),
    })),

    -- RWMutex
    s("rwmutex", fmt([[
var mu sync.RWMutex
mu.RLock()
{}
mu.RUnlock()
]], {
        i(1, ""),
    })),

    -- HTTP Middleware
    s("middleware", fmt([[
func {}(next http.Handler) http.Handler {{
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {{
        {}
        next.ServeHTTP(w, r)
    }})
}}
]], {
        i(1, "middlewareName"),
        i(2, "// middleware logic"),
    })),

    -- HTTP Server with Router
    s("httpserver", fmt([[
mux := http.NewServeMux()
mux.HandleFunc("{}", {})

server := &http.Server{{
    Addr:    ":{},
    Handler: mux,
    ReadTimeout:  {}*time.Second,
    WriteTimeout: {}*time.Second,
}}

log.Fatal(server.ListenAndServe())
]], {
        i(1, "/"),
        i(2, "handler"),
        i(3, "8080"),
        i(4, "10"),
        i(5, "10"),
    })),

    -- Time Parse
    s("timeparse", fmt([[
t, err := time.Parse("{}", "{}")
if err != nil {{
    return err
}}
]], {
        i(1, "2006-01-02"),
        i(2, "2023-01-01"),
    })),

    -- Time Format
    s("timefmt", fmt([[
formatted := time.Now().Format("{}")
]], {
        i(1, "2006-01-02 15:04:05"),
    })),

    -- Flag Parse
    s("flag", fmt([[
{} := flag.{}("{}", {}, "{}")
flag.Parse()
]], {
        i(1, "name"),
        i(2, "String"),
        f(function(args) return args[1][1] end, {1}),
        i(3, "default"),
        i(4, "description"),
    })),

    -- Benchmark
    s("bench", fmt([[
func Benchmark{}(b *testing.B) {{
    for i := 0; i < b.N; i++ {{
        {}
    }}
}}
]], {
        i(1, "FunctionName"),
        i(2, ""),
    })),

    -- HTTP Get Request
    s("httpget", fmt([[
resp, err := http.Get("{}")
if err != nil {{
    return err
}}
defer resp.Body.Close()

body, err := io.ReadAll(resp.Body)
if err != nil {{
    return err
}}
]], {
        i(1, "url"),
    })),

    -- HTTP Post Request
    s("httppost", fmt([[
resp, err := http.Post("{}", "application/json", bytes.NewBuffer({}))
if err != nil {{
    return err
}}
defer resp.Body.Close()
]], {
        i(1, "url"),
        i(2, "jsonData"),
    })),

    -- JSON Marshal
    s("jmarshal", fmt([[
data, err := json.Marshal({})
if err != nil {{
    return err
}}
]], {
        i(1, "obj"),
    })),

    -- JSON Unmarshal
    s("junmarshal", fmt([[
var {} {}
err := json.Unmarshal({}, &{})
if err != nil {{
    return err
}}
]], {
        i(1, "result"),
        i(2, "Type"),
        i(3, "data"),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- Sprintf
    s("spf", fmt('s := fmt.Sprintf("{}", {})', {
        i(1, "%v"),
        i(2, ""),
    })),

    -- Error Wrap
    s("errwrap", fmt('return fmt.Errorf("{}: %w", {})', {
        i(1, "error message"),
        i(2, "err"),
    })),

    -- Custom Error Type
    s("errtype", fmt([[
type {} struct {{
    {}
}}

func (e *{}) Error() string {{
    return fmt.Sprintf("{}", {})
}}
]], {
        i(1, "CustomError"),
        i(2, "Msg string"),
        f(function(args) return args[1][1] end, {1}),
        i(3, "%s"),
        i(4, "e.Msg"),
    })),
}
