--module "queue"

Queue = {
  new = function(self)
    self.__index = self
    return setmetatable( {first=0, last=-1}, self)
  end,
  
  push = function(self, value)
    local last = self.last + 1
    self[last] = value
    self.last = last
  end,
  
  pop = function(self)
    local first = self.first
    if first <= self.last then
      local value = self[first]
      self[first] = nil
      self.first = first + 1
      return value
    end
  end,
  
  size = function(self)
    return self.last - self.first + 1
  end
  
}