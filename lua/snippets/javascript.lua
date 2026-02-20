local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- React Functional Component
    s("rfc", fmt([[
import React from 'react';

const {} = ({}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
        i(1, "ComponentName"),
        i(2, "props"),
        i(3, ""),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- React Functional Component with TypeScript
    s("rfct", fmt([[
import React from 'react';

interface {}Props {{
  {}
}}

const {}: React.FC<{}Props> = ({}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
        i(1, "ComponentName"),
        i(2, ""),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(3, "props"),
        i(4, ""),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- useState Hook
    s("us", fmt([[
const [{}, set{}] = useState({});
]], {
        i(1, "state"),
        f(function(args)
            local state = args[1][1]
            return state:sub(1,1):upper() .. state:sub(2)
        end, {1}),
        i(2, "initialValue"),
    })),

    -- useEffect Hook
    s("ue", fmt([[
useEffect(() => {{
  {}
}}, [{}]);
]], {
        i(1, ""),
        i(2, ""),
    })),

    -- useContext Hook
    s("uc", fmt([[
const {} = useContext({});
]], {
        i(1, "context"),
        i(2, "Context"),
    })),

    -- useCallback Hook
    s("ucb", fmt([[
const {} = useCallback(() => {{
  {}
}}, [{}]);
]], {
        i(1, "callback"),
        i(2, ""),
        i(3, ""),
    })),

    -- useMemo Hook
    s("um", fmt([[
const {} = useMemo(() => {}, [{}]);
]], {
        i(1, "memoized"),
        i(2, "value"),
        i(3, ""),
    })),

    -- useRef Hook
    s("uref", fmt([[
const {} = useRef({});
]], {
        i(1, "ref"),
        i(2, "null"),
    })),

    -- Express Route Handler
    s("route", fmt([[
router.{}('{}', async (req, res) => {{
  try {{
    {}
    res.status(200).json({{ success: true }});
  }} catch (error) {{
    res.status(500).json({{ error: error.message }});
  }}
}});
]], {
        i(1, "get"),
        i(2, "/path"),
        i(3, ""),
    })),

    -- Express Middleware
    s("middleware", fmt([[
const {} = async (req, res, next) => {{
  try {{
    {}
    next();
  }} catch (error) {{
    next(error);
  }}
}};
]], {
        i(1, "middlewareName"),
        i(2, ""),
    })),

    -- Async/Await Function
    s("af", fmt([[
const {} = async ({}) => {{
  try {{
    {}
  }} catch (error) {{
    console.error(error);
  }}
}};
]], {
        i(1, "functionName"),
        i(2, ""),
        i(3, ""),
    })),

    -- Promise
    s("prom", fmt([[
return new Promise((resolve, reject) => {{
  {}
}});
]], {
        i(1, ""),
    })),

    -- Try-Catch
    s("tc", fmt([[
try {{
  {}
}} catch (error) {{
  {}
}}
]], {
        i(1, ""),
        i(2, "console.error(error);"),
    })),

    -- Console Log
    s("cl", fmt("console.log({});", { i(1, "") })),

    -- Console Error
    s("ce", fmt("console.error({});", { i(1, "") })),

    -- Import Statement
    s("imp", fmt("import {} from '{}';", {
        i(1, "module"),
        i(2, ""),
    })),

    -- Import Destructured
    s("imd", fmt("import {{ {} }} from '{}';", {
        i(1, ""),
        i(2, ""),
    })),

    -- Export Default
    s("exp", fmt("export default {};", { i(1, "") })),

    -- Export Named
    s("exn", fmt("export {{ {} }};", { i(1, "") })),

    -- Arrow Function
    s("arr", fmt([[
const {} = ({}) => {{
  {}
}};
]], {
        i(1, "functionName"),
        i(2, ""),
        i(3, ""),
    })),

    -- Map Function
    s("map", fmt([[
{}.map(({}) => {{
  {}
}})
]], {
        i(1, "array"),
        i(2, "item"),
        i(3, "return item;"),
    })),

    -- Filter Function
    s("filter", fmt([[
{}.filter(({}) => {})
]], {
        i(1, "array"),
        i(2, "item"),
        i(3, "item"),
    })),

    -- Reduce Function
    s("reduce", fmt([[
{}.reduce((acc, {}) => {{
  {}
  return acc;
}}, {})
]], {
        i(1, "array"),
        i(2, "item"),
        i(3, ""),
        i(4, "initialValue"),
    })),

    -- Fetch API GET
    s("fetch", fmt([[
fetch('{}')
  .then(response => response.json())
  .then(data => {{
    {}
  }})
  .catch(error => {{
    console.error('Error:', error);
  }});
]], {
        i(1, "url"),
        i(2, "console.log(data);"),
    })),

    -- Fetch API POST
    s("fetchpost", fmt([[
fetch('{}', {{
  method: 'POST',
  headers: {{
    'Content-Type': 'application/json',
  }},
  body: JSON.stringify({}),
}})
  .then(response => response.json())
  .then(data => {{
    {}
  }})
  .catch(error => {{
    console.error('Error:', error);
  }});
]], {
        i(1, "url"),
        i(2, "data"),
        i(3, "console.log(data);"),
    })),

    -- Async Fetch
    s("afetch", fmt([[
const {} = async () => {{
  try {{
    const response = await fetch('{}');
    const data = await response.json();
    {}
  }} catch (error) {{
    console.error('Error:', error);
  }}
}};
]], {
        i(1, "fetchData"),
        i(2, "url"),
        i(3, "return data;"),
    })),

    -- Axios GET
    s("axget", fmt([[
axios.get('{}')
  .then(response => {{
    {}
  }})
  .catch(error => {{
    console.error('Error:', error);
  }});
]], {
        i(1, "url"),
        i(2, "console.log(response.data);"),
    })),

    -- Axios POST
    s("axpost", fmt([[
axios.post('{}', {})
  .then(response => {{
    {}
  }})
  .catch(error => {{
    console.error('Error:', error);
  }});
]], {
        i(1, "url"),
        i(2, "data"),
        i(3, "console.log(response.data);"),
    })),

    -- Custom Hook
    s("hook", fmt([[
import {{ useState, useEffect }} from 'react';

const use{} = ({}) => {{
  const [state, setState] = useState({});

  useEffect(() => {{
    {}
  }}, [{}]);

  return {};
}};

export default use{};
]], {
        i(1, "CustomHook"),
        i(2, ""),
        i(3, "null"),
        i(4, ""),
        i(5, ""),
        i(6, "state"),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- Context Provider
    s("ctx", fmt([[
import React, {{ createContext, useContext, useState }} from 'react';

const {}Context = createContext();

export const use{} = () => {{
  const context = useContext({}Context);
  if (!context) {{
    throw new Error('use{} must be used within {}Provider');
  }}
  return context;
}};

export const {}Provider = ({{ children }}) => {{
  const [state, setState] = useState({});

  const value = {{
    state,
    setState,
    {}
  }};

  return (
    <{}Context.Provider value={{value}}>
      {{children}}
    </{}Context.Provider>
  );
}};
]], {
        i(1, "MyContext"),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(2, "null"),
        i(3, ""),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- Error Boundary
    s("errbound", fmt([[
import React from 'react';

class {} extends React.Component {{
  constructor(props) {{
    super(props);
    this.state = {{ hasError: false }};
  }}

  static getDerivedStateFromError(error) {{
    return {{ hasError: true }};
  }}

  componentDidCatch(error, errorInfo) {{
    console.error('Error caught:', error, errorInfo);
  }}

  render() {{
    if (this.state.hasError) {{
      return <h1>{}</h1>;
    }}

    return this.props.children;
  }}
}}

export default {};
]], {
        i(1, "ErrorBoundary"),
        i(2, "Something went wrong."),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- React Class Component
    s("rcc", fmt([[
import React, {{ Component }} from 'react';

class {} extends Component {{
  constructor(props) {{
    super(props);
    this.state = {{
      {}
    }};
  }}

  componentDidMount() {{
    {}
  }}

  render() {{
    return (
      <div>
        {}
      </div>
    );
  }}
}}

export default {};
]], {
        i(1, "ComponentName"),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- Jest Test
    s("test", fmt([[
describe('{}', () => {{
  test('{}', () => {{
    {}
    expect({}).toBe({});
  }});
}});
]], {
        i(1, "Test Suite"),
        i(2, "should work correctly"),
        i(3, ""),
        i(4, "result"),
        i(5, "expected"),
    })),

    -- Jest Test with Async
    s("testa", fmt([[
describe('{}', () => {{
  test('{}', async () => {{
    {}
    const result = await {}();
    expect(result).toBe({});
  }});
}});
]], {
        i(1, "Test Suite"),
        i(2, "should work correctly"),
        i(3, ""),
        i(4, "asyncFunction"),
        i(5, "expected"),
    })),

    -- React Testing Library
    s("rtl", fmt([[
import {{ render, screen }} from '@testing-library/react';
import {} from './{}';

describe('{}', () => {{
  test('renders correctly', () => {{
    render(<{} />);
    const element = screen.getByText(/{}!/i);
    expect(element).toBeInTheDocument();
  }});
}});
]], {
        i(1, "Component"),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(2, "text"),
    })),

    -- setTimeout
    s("sto", fmt([[
setTimeout(() => {{
  {}
}}, {});
]], {
        i(1, ""),
        i(2, "1000"),
    })),

    -- setInterval
    s("si", fmt([[
setInterval(() => {{
  {}
}}, {});
]], {
        i(1, ""),
        i(2, "1000"),
    })),

    -- Object Destructuring
    s("dest", fmt("const {{ {} }} = {};", {
        i(1, ""),
        i(2, "object"),
    })),

    -- Array Destructuring
    s("desa", fmt("const [{}, {}] = {};", {
        i(1, ""),
        i(2, ""),
        i(3, "array"),
    })),

    -- Ternary Operator
    s("ter", fmt("{} ? {} : {}", {
        i(1, "condition"),
        i(2, "true"),
        i(3, "false"),
    })),

    -- Object Method
    s("om", fmt([[
{}: function({}) {{
  {}
}}
]], {
        i(1, "methodName"),
        i(2, ""),
        i(3, ""),
    })),

    -- Class with Constructor
    s("class", fmt([[
class {} {{
  constructor({}) {{
    {}
  }}

  {}() {{
    {}
  }}
}}
]], {
        i(1, "ClassName"),
        i(2, ""),
        i(3, ""),
        i(4, "method"),
        i(5, ""),
    })),

    -- Express Error Handler
    s("errhandler", fmt([[
app.use((err, req, res, next) => {{
  console.error(err.stack);
  res.status({}).json({{
    error: {{
      message: err.message,
      {}
    }}
  }});
}});
]], {
        i(1, "500"),
        i(2, ""),
    })),

    -- Express CORS Middleware
    s("cors", fmt([[
app.use((req, res, next) => {{
  res.header('Access-Control-Allow-Origin', '{}');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') {{
    return res.sendStatus(200);
  }}

  next();
}});
]], {
        i(1, "*"),
    })),

    -- MongoDB Schema (Mongoose)
    s("schema", fmt([[
const mongoose = require('mongoose');

const {}Schema = new mongoose.Schema({{
  {}
}}, {{
  timestamps: true
}});

module.exports = mongoose.model('{}', {}Schema);
]], {
        i(1, "Model"),
        i(2, ""),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
    })),

    -- Find and ForEach
    s("fe", fmt([[
{}.forEach(({}) => {{
  {}
}});
]], {
        i(1, "array"),
        i(2, "item"),
        i(3, ""),
    })),

    -- Some
    s("some", fmt("{}.some(({}) => {})", {
        i(1, "array"),
        i(2, "item"),
        i(3, "item"),
    })),

    -- Every
    s("every", fmt("{}.every(({}) => {})", {
        i(1, "array"),
        i(2, "item"),
        i(3, "item"),
    })),

    -- Find
    s("find", fmt("{}.find(({}) => {})", {
        i(1, "array"),
        i(2, "item"),
        i(3, "item"),
    })),

    -- FindIndex
    s("findi", fmt("{}.findIndex(({}) => {})", {
        i(1, "array"),
        i(2, "item"),
        i(3, "item"),
    })),

    -- Object.keys
    s("keys", fmt("Object.keys({})", { i(1, "object") })),

    -- Object.values
    s("vals", fmt("Object.values({})", { i(1, "object") })),

    -- Object.entries
    s("entries", fmt("Object.entries({})", { i(1, "object") })),

    -- JSON.stringify
    s("jstr", fmt("JSON.stringify({}, null, 2)", { i(1, "object") })),

    -- JSON.parse
    s("jpar", fmt("JSON.parse({})", { i(1, "string") })),

    -- LocalStorage Set
    s("lset", fmt("localStorage.setItem('{}', JSON.stringify({}));", {
        i(1, "key"),
        i(2, "value"),
    })),

    -- LocalStorage Get
    s("lget", fmt("JSON.parse(localStorage.getItem('{}'));", { i(1, "key") })),

    -- SessionStorage Set
    s("sset", fmt("sessionStorage.setItem('{}', JSON.stringify({}));", {
        i(1, "key"),
        i(2, "value"),
    })),

    -- SessionStorage Get
    s("sget", fmt("JSON.parse(sessionStorage.getItem('{}'));", { i(1, "key") })),
}
