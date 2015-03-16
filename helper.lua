


function table2string(tabl)
	local k,v,str=0,0,""
	if type(tabl)~="table" then
		message('in table2string table = ' .. tabl, 2)
	end
	
	for k,v in pairs(tabl) do
		if v == nil then
      str=str..k..'="nil";'
    elseif type(v)=="string" or type(v)=="number" then
			str = str..k.."="..v..';'
		elseif type(v)=="table"then
			str = str..k.."={"..table2string(v).."};"
		elseif type(v)=="function" or type(v)=='boolean' then
			str = str..k..'='..tostring(v)..';'
		end
	end
	return str
end


function count(list)
  local _count = 0
  for _,_ in pairs(list) do 
    _count = _count + 1 
  end
  return _count
end


function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

--[[ get params for given sec@class 
if params is nil then func return default params 
def params = 'bid,offer,optionbase,strike,optiontype,DAYS_TO_MAT_DATE,offerdepth,biddepth'
return table of this params
*remark 'DAYS_TO_MAT_DATE' replace 'dtm'
Example: call of get_params('SPBFUT', 'SiH5', 'bid,offer,DAYS_TO_MAT_DATE') return 
table {'bid'=12,'offer'=13,'dte'=3}
]]
function get_params(ccode, scode, params)
  if not params then
    params='bid,offer,optionbase,strike,optiontype,DAYS_TO_MAT_DATE,offerdepth,biddepth'
  end
  local res_t = {}
  for p in string.gmatch(params, "[%w_]+") do
    local t = getParamEx(ccode, scode, p) -- 0.021ms
    if tonumber(t.param_type) == 1 or tonumber(t.param_type) == 2 then
      if p == 'DAYS_TO_MAT_DATE' then
        res_t['dtm'] = tonumber(t.param_value)
      else
        res_t[p] = tonumber(t.param_value)
      end
    else
      res_t[p] = t.param_image
    end
  end
  return res_t
end