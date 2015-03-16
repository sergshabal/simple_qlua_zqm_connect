local pd = ';F:\\Programming\\lua\\cs'

package.cpath = pd .. pd..'\\?.dll' ..pd..'\\?\\?.dll;'.. package.cpath
package.path = pd .. pd..'\\?.lua;' .. package.path 


message('package.cpath  '..package.cpath)
message('package.path  '..package.path)
message('getScriptPath()  '..  getScriptPath())

local helper = require("helper")
local queue = require("queue")
local zmq = require("zmq")
local socket = require("socket.core")


function main()
  message('cs' .. " starting.")
  message('cs' .. " stopping.")
end


