local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

ls.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-U>", function() require("luasnip.extras.select_choice")() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

local function fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent,   -- parent snippet or parent node
  user_args, -- user_args from opts.user_args 
  user_args1, -- user_args from opts.user_args 
  user_args2 -- is camel case
)
  input = args[1][1]

  if user_args2 then
    input = input:gsub("^%l", string.upper)
  end

  return user_args .. input .. user_args1
end

ls.add_snippets("javascript", {
  s("api_get", {
    f(fn, 
      {2}, 
      { 
        user_args = { "export async function ", "({ " },
      }
    ),
    i(3), t({" }) {"}),
    t({"", "  try {"}),
    t({"", "    const {"}),
    t({"", "      Config: { currentApi },"}),
    t({"", "    } = Credentials"}),
    t({"", "    const result = await axios({"}),
    t({"", "      method: 'GET',"}),
    t({"", "      url: `${currentApi}"}), i(1), t({"`,"}),
    t({"", "    })"}),
    t({"", "    return result.data"}),
    t({"", "  } catch (e) {"}),
    t({"", "    console.log('API ERROR "}), i(2), t({": ', e)"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),
  s("api_p", {
    f(fn, 
      {2}, 
      { 
        user_args = { "export async function ", "({ data, " },
      }
    ),
    i(3), t({" }) {"}),
    t({"", "  try {"}),
    t({"", "    const {"}),
    t({"", "      Config: { currentApi },"}),
    t({"", "    } = Credentials"}),
    t({"", "    const result = await axios({"}),
    t({"", "      method: '"}), c(4, {
      t({"POST"}),
      t({"PUT"}),
      t({"PATCH"})
    }), t({"',"}),
    t({"", "      url: `${currentApi}"}), i(1), t({"`,"}),
    t({"", "      data,"}),
    t({"", "    })"}),
    t({"", "    return result.data"}),
    t({"", "  } catch (e) {"}),
    t({"", "    console.log('API ERROR "}), i(2), t({": ', e)"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),
  s("use_state", {
    t({"const ["}), i(1),
    f(fn,
      {1},
      {
        user_args = { ", set", "] = useState(", true }
      } 
    ),
    i(2), t({")"})
  }),
  s("create_thunk", {
    t({"export const "}), i(1), t({"= createAsyncThunk("}), i(2), t({", async ("}), i(3), t({"thunkAPI) => {"}),
    t({"", "  try {"}),
    t({"", "    "}), 
    t({"", "    return thunkAPI.fulfillWithValue("}), i(4), t({")"}),
    t({"", "  } catch (e) {"}),
    t({"", "    return thunkAPI.rejectWithValue({ reason: "}), i(5), t({" + e })"}),
    t({"", "  }"}),
    t({"", "})"})
  }),
  s("create_thunk_reducer", {
    t({"const "}), i(1), t({"FulfilledReducer = (state, action) => {"}),
    t({"", "  "}), i(2),
    t({"", "}"}),
    t({"", ""}), f(fn,
      {1},
      {
        user_args = { "const ", "RejectedReducer = (state, action) => {" }
      }
    ),
    t({"", "  const { reason } = action.payload"}),
    t({"", ""}), f(fn,
      {1},
      {
        user_args = { "  console.log('", " rejected reason: ', reason)" }
      }
    ),
    t({"", "  "}), i(3),
    t({"", "}"})
  }),
  s("export_thunk_reducer", {
    t({"["}), i(1), t({"]: {"}),
    t({"", "  fulfilled: {"}),
    t({"", "    actionCreator: "}), i(2), t({".fulfilled,"}),
    t({"", ""}), f(fn, 
      {2},
      {
        user_args = { "    reducer: ", "FulfilledReducer" }
      }
    ),
    t({"", "  },"}),
    t({"", "  rejected: {"}),
    t({"", ""}), f(fn, 
      {2},
      {
        user_args = { "    actionCreator: ", ".rejected," }
      }
    ),
    t({"", ""}), f(fn, 
      {2},
      {
        user_args = { "    reducer: ", "RejectedReducer" }
      }
    ),
    t({"", "  },"}),
    t({"", "},"})
  }),
  s("use_effect", {
    t({"useEffect(() => {"}), i(1), t({"}, ["}), i(2), t({"])"})
  }),
  s("log", {
    f(fn, 
      {1},
      {
        user_args = { "console.log('BDP ", ": ', " }
      }
    ),
    i(1), t({")"})
  })
})
