# <p align="center">Lua Programming Language Tutorial</p>
---
## Lua's Keywords
```
and            break          do             else           elseif         end
false          for            function       goto           if             in
local          nil            not            or             repeat         return
then           true           until          while
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

## Quick idioms
- a, b = a, b
- There's no ternary operator but can
```lua
return x == 1 and "yes" or "no"
```
- The access to local variables is faster than global
```lua
local match = string.match
```
## Comments
```lua
-- comments start with two dashes
--[[ 
     adding two square brackets
     makes the comments multi-line
--]]
```
## Ralational Expressions
Relational operators are supplied which return the boolean values `true` or `false`
- `==` equal to
- `~=` not equal to
- `<` less than
- `>` greater than
- `<=` less than or equal to
- `>=` greater than or equal to
## Logical operators
Lua provides the logical operators `and`, `or` and `not`. In Lua both `nil` and the boolean value `false` represent false in a logical expression. Anything that is not false (either `nil` or `false`) is `true`.

## Data Types


## Variables
Create a variable within a control module by using:
``` lua
-- local variables are only accessible in the script they have been created in
local variable_name = 10
-- global variable accessible everywhere in Control
global_variable = 1
-- self.name variable are accessible within the module
self.module_variable = 2
--doing this can sometimes be bad practice
local _G.myValue = 3
```
__More Examples:__
```lua
local number = 5
local string = "hello, world"
local single = 'also works, single quoted strings'
local crazy = [[ This
 is multi line and literal
]]
local truth, lies = true, false
local nothing = nil
```
## Booleans
```lua
booleanValue = true
-- `not` can be used to invert boolean values
oppositeValue = not booleanValue                  --> false
definitelyBoolean = not not booleanValue          --> true
if not oppositeValue then print('it was false') end
--> it was false

-- `not` coerces other types to booleans
-- all values except nil and false are truthy
print(not 'a')          --> false
print(not not 'a')      --> true
```
## Control flow
Lua has one type of conditional test: `if then end` with optional `else` and `elseif then` execution control constructs
```lua
if condition then
	--statement body
elseif condition then
	--statement body
else -- optional
	--optional default statement body
end
```
## Loops
Lua has four types of conditional loops: the `while` loop, the `repeat until` loop (similar to a `do while` loop), the numeric `for` loop and the generic `for` loop.
```lua
--condition = true

while condition do
  --statements
end

repeat
  --statements
until condition

for i = first, last, delta do  --delta may be negative, allowing the for loop to count down or up
  --statements
  --example: print(i)
end
```

## Tables
- The only way to structure data
- Array, dictionary, object, list, queue, module,...
- Any value can by a key, except `nil` and `nan`
- Behind the scenes; array or hash table
- Passed as reference
- The length operator: `#`
- In Lua, pairs is a built-in function used to iterate over all key-value pairs in a table. It returns a key-value pair for each iteration. Here's the basic syntax:
  - `ipairs()` returns index-value pairs and is mostly used for numeric tables. The non-numeric keys are ignored as a whole, similar to numeric indices less than 1. In addition, gaps in between the indices lead to halts. The ordering is deterministic, by numeric magnitude.
	```lua
	for key, value in ipairs(your_table) do
	     print(key, value)
	end
	```
  - `pairs()` returns key-value pairs and is mostly used for associative tables. All keys are preserved, but the order is unspecified.
	```lua
	for key, value in pairs(your_table) do
	     print(key, value)
	end
  	```
  - In addition, while `pairs()` may be used to get the size of a table [see here](https://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table), using `ipairs()` for the same task is unsafe a priori, since it might miss some keys.


## Functions

## Modules

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

## Object-oriented programming

## Inheritance

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
- [Lua Basic Overview](https://help.pixera.one/lua-basic-overview)
