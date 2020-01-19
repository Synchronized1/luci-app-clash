
local NXFS = require "nixio.fs"
local SYS  = require "luci.sys"
local HTTP = require "luci.http"
local DISP = require "luci.dispatcher"
local UTIL = require "luci.util"
local uci = require("luci.model.uci").cursor()
local fs = require "luci.clash"
local http = luci.http
local m,s,sev

m = Map("clash")
s = m:section(TypedSection, "clash")
m.pageaction = false
s.anonymous = true
s.addremove=false


local conf = "/usr/share/clash/config/sub/config.yaml"
sev = s:option(TextValue, "conf")
--sev.readonly=true
sev.rows = 20
sev.wrap = "off"
sev.template="clash/form_sub"
sev.cfgvalue = function(self, section)
	return NXFS.readfile(conf) or ""
end



return m
