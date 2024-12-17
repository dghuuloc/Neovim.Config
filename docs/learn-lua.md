# <p align="center">Lua Programming Language Tutorial</p>
---
## Lua's Keywords
```
and       break     do        else      elseif    end
false     for       function  goto      if        in
local     nil       not       or        repeat    return
then      true      until     while
```

```
_G                    coroutine.create           file:close           os.clock               table.pack
_VERSION              coroutine.resume           file:flush           os.date                table.remove
assert                coroutine.running          file:lines           os.difftime            table.sort
collectgarbage        coroutine.status           file:read            os.execute             table.unpack
dofile                coroutine.wrap             file:seek            os.exit
error                 coroutine.yield            file:setvbuf         os.getenv
getmetatable          debug.debug                file:write           os.remove
ipairs                debug.getuservalue         math.abs             os.rename
load                  debug.gethook              math.acos            os.setlocale
loadfile              debug.getinfo              math.asin            os.time
next                  debug.getlocal             math.atan            os.tmpname
pairs                 debug.getmetatable         math.atan2           package
pcall                 debug.getregistry          math.ceil            package.config
print                 debug.getupvalue           math.cos             package.cpath
rawequal              debug.setuservalue         math.cosh            package.loaded
rawget                debug.sethook              math.deg             package.loadlib
rawlen                debug.setlocal             math.exp             package.path
rawset                debug.setmetatable         math.floor           package.preload
require               debug.setupvalue           math.fmod            package.searchers
select                debug.traceback            math.frexp           package.searchpath
setmetatable          debug.upvalueid            math.huge            string.byte
tonumber              debug.upvaluejoin          math.ldexp           string.char
tostring              io.close                   math.log             string.dump
type                  io.flush                   math.max             string.find
xpcall                io.input                   math.min             string.format
bit32.arshift         io.lines                   math.modf            string.gmatch
bit32.band            io.open                    math.pi              string.gsub
bit32.bnot            io.output                  math.pow             string.len
bit32.bor             io.popen                   math.rad             string.lower
bit32.btest           io.read                    math.random          string.match
bit32.bxor            io.stderr                  math.randomseed      string.rep
bit32.extract         io.stdin                   math.sin             string.reverse
bit32.lrotate         io.stdout                  math.sinh            string.sub
bit32.lshift          io.tmpfile                 math.sqrt            string.upper
bit32.replace         io.type                    math.tan             table.concat
bit32.rrotate         io.write                   math.tanh            table.insert
bit32.rshift
```

## What's different
- The index starts at `1`
- There's no `continue` keyword
- The non-equality operator is `~=`
- `null` is `nil`
- Only `nil` and `false` are equivalent to false
- Functions can genuinely return multiple values
- Variables are global by default
- Pattern matching is not regular expression
- The concatenation operator is `..`

## Quick idions
- a, b = a, b
- There's no ternary operator but can
```lua
return x == 1 and "yes" or "no"
```
- The access to local variables is faster than global
```lua
local match = string.match
```
## Tables
- The only way to structure data
- Array, dictionary, object, list, queue, module,...
- Any value can by a key, except `nil` and `nan`
- Behind the scenes; array or hash table
- Passed as reference
- The length operator: `#`
- `pairs(t)`, `ipairs(t)`
## Metatables
- Overload operators
- Override built-in functions such as tostring
- Treat missing fields or intercept new field creation
- Call table as a function
- Metamethods:
```
__add, __sub, __mul, __div, __mod, __pow, __unm, __concat, __len, __eq, __lt,
__le, __index, __newindex, __call, __tostring, __ipairs, __pairs, __gc
```
---
## Comments
```lua
-- This is a comment. It starts with two dashes
--[[ This is also
     a comment.
     But it spans multiple lines!
--]]
```
## Variables
Create a variable within a control module by using:
``` lua
-- local variables are only accessible in the script they have been created in
local variable_name = 10
-- global variable accessible everywhere in Control
global_variable = 1
-- self.name variable are accessible within the module
self.module_variable = 2
```
__More Examples:__
```lua
local number = 5
local string = "hello, world"
local single = 'also works'
local crazy = [[ This
 is multi line and literal ]]
local truth, lies = true, false
local nothing = nil
```

## References
- [Lua Crash Course](https://github.com/tjdevries/advent-of-nvim/blob/master/03%20-%20Lua%20Crash%20Course/03%20-%20Lua%20Crash%20Course.md)
- [Lua Tutorial](https://gamedevacademy.org/lua-programming-language-tutorial-complete-guide/)
- [Lua Beginners Guide](https://github.com/pohka/Lua-Beginners-Guide)
- [Welcome to Lua](https://github.com/gridlocdev/lua-beginners-guide)
- [The Lua Tutorial](https://dev.to/jd2r/the-lua-tutorial-544b)
- [Learn Lua in 15 Minutes](https://tylerneylon.com/a/learn-lua/)
- [Lua Script in a Nutshell](https://medium.com/@abanoubwagih/lua-script-in-a-nutshell-0c02eb933650)
- [Lua Object-Oriented-Programming](https://paulwatt526.github.io/wattageTileEngineDocs/luaOopPrimer.html)
- [lua-style-guide](https://github.com/luarocks/lua-style-guide)
- [lua-style-guide](https://github.com/Olivine-Labs/lua-style-guide/)
- [Functions as First Class Objects](https://www.youtube.com/watch?v=9hAyj2vVg0o)
- [Lua Scripting Cheat Sheet](https://cheatography.com/srgmc/cheat-sheets/lua-scripting-5-1/)
- [Lua Cheatsheet](https://devhints.io/lua)
- [Lua](https://gist.github.com/nilesh-tawari/02078ae5b83ce3c90f476c4858c60693)
- [Lua CheatSheet](https://www.whoop.ee/post/lua-cheatsheet.html)
- [References and Values](https://www.whoop.ee/post/types-in-lua-references-vs-values.html)
- [Lua Quick Start Guide](https://github.com/gszauer/LuaQuickStartGuide)
- [learn.lua](https://gist.github.com/tylerneylon/5853042)
- [Get started with Lua programming](https://www.slideshare.net/slideshow/get-started-with-lua-programming/55292718)
