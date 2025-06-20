local dap = require "dap"
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.adapters.go = function(callback, config)
  local handle
  local pid_or_err
  local port = config.port or 2345

  handle, pid_or_err = vim.loop.spawn("dlv", {
    args = {
      "connect",
      "127.0.0.1:" .. port,
    },
    detached = true,
  }, function(code)
    handle:close()
    print("Delve exited with exit code: " .. code)
  end)

  vim.defer_fn(function()
    callback { type = "server", host = "127.0.0.1", port = port }
  end, 100)
end

local get_args = function()
  -- 获取输入命令行参数
  local cmd_args = vim.fn.input "CommandLine Args:"
  local params = {}
  -- 定义分隔符(%s在lua内表示任何空白符号)
  for param in string.gmatch(cmd_args, "[^%s]+") do
    table.insert(params, param)
  end
  return params
end

local function filtered_pick_process()
  local opts = {}
  vim.ui.input(
    { prompt = "Search by process name (lua pattern), or hit enter to select from the process list: " },
    function(input)
      opts["filter"] = input or ""
    end
  )
  return require("dap.utils").pick_process(opts)
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    args = get_args,
    program = "${file}",
    outputMode = "remote",
  },
  {
    type = "delve",
    name = "Debug pkg",
    request = "launch",
    args = get_args,
    program = "${relativeFileDirname}",
    outputMode = "remote",
  },
  {
    type = "delve",
    name = "Attach",
    request = "attach",
    mode = "local",
    processId = filtered_pick_process,
    outputMode = "remote",
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    args = get_args,
    program = "${file}",
    outputMode = "remote",
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    args = get_args,
    program = "./${relativeFileDirname}",
    outputMode = "remote",
  },
  {
    type = "go",
    name = "Attach Remote",
    request = "attach",
    mode = "remote",
    port = 52345,
    host = "127.0.0.1",
  },
}
