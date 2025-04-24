return {
  -- autocomplete
  {
    enabled = os.getenv('NVIM_DEV') == nil,
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    opts = {
      keymaps = {
        accept_suggestion = '<M-i>',
      },
      color = {
        -- TODO: use onedark.nvim
        suggestion_color = '#585b70',
      },
      log_level = 'off',
    },
  },

  -- chat with code
  {
    'robitx/gp.nvim',
    -- stylua: ignore
    keys = {
      -- Chat commands
      { "<C-a>c", "<cmd>GpChatNew<cr>",    mode = { "n", "i" }, desc = "GPT prompt New Chat",    nowait = true },
      { "<C-a>t", "<cmd>GpChatToggle<cr>", mode = { "n", "i" }, desc = "GPT prompt Toggle Chat", nowait = true },
      { "<C-a>f", "<cmd>GpChatFinder<cr>", mode = { "n", "i" }, desc = "GPT prompt Chat Finder", nowait = true },

      { "<C-a>c", ":<C-u>'<,'>GpChatNew<cr>",    mode = "v", desc = "GPT prompt Visual Chat New",    nowait = true },
      { "<C-a>p", ":<C-u>'<,'>GpChatPaste<cr>",  mode = "v", desc = "GPT prompt Visual Chat Paste",  nowait = true },
      { "<C-a>t", ":<C-u>'<,'>GpChatToggle<cr>", mode = "v", desc = "GPT prompt Visual Toggle Chat", nowait = true },

      { "<C-a><C-x>", "<cmd>GpChatNew split<cr>",  mode = { "n", "i" }, desc = "GPT prompt New Chat split",  nowait = true },
      { "<C-a><C-v>", "<cmd>GpChatNew vsplit<cr>", mode = { "n", "i" }, desc = "GPT prompt New Chat vsplit", nowait = true },
      { "<C-a><C-t>", "<cmd>GpChatNew tabnew<cr>", mode = { "n", "i" }, desc = "GPT prompt New Chat tabnew", nowait = true },

      { "<C-a><C-x>", ":<C-u>'<,'>GpChatNew split<cr>",  mode = "v", desc = "GPT prompt Visual Chat New split",  nowait = true },
      { "<C-a><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", mode = "v", desc = "GPT prompt Visual Chat New vsplit", nowait = true },
      { "<C-a><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", mode = "v", desc = "GPT prompt Visual Chat New tabnew", nowait = true },

      -- Prompt commands
      { "<C-a>r", "<cmd>GpRewrite<cr>", mode = { "n", "i" }, desc = "GPT prompt Inline Rewrite",   nowait = true },
      { "<C-a>a", "<cmd>GpAppend<cr>",  mode = { "n", "i" }, desc = "GPT prompt Append (after)",   nowait = true },
      { "<C-a>b", "<cmd>GpPrepend<cr>", mode = { "n", "i" }, desc = "GPT prompt Prepend (before)", nowait = true },

      { "<C-a>r", ":<C-u>'<,'>GpRewrite<cr>",   mode = "v",  desc = "GPT prompt Visual Rewrite",          nowait = true },
      { "<C-a>a", ":<C-u>'<,'>GpAppend<cr>",    mode = "v",  desc = "GPT prompt Visual Append (after)",   nowait = true },
      { "<C-a>b", ":<C-u>'<,'>GpPrepend<cr>",   mode = "v",  desc = "GPT prompt Visual Prepend (before)", nowait = true },
      { "<C-a>i", ":<C-u>'<,'>GpImplement<cr>", mode = "v", desc = "GPT prompt Implement selection",     nowait = true },

      { "<C-a>gp", "<cmd>GpPopup<cr>",  mode = { "n", "i" }, desc = "GPT prompt Popup",    nowait = true },
      { "<C-a>ge", "<cmd>GpEnew<cr>",   mode = { "n", "i" }, desc = "GPT prompt GpEnew",   nowait = true },
      { "<C-a>gn", "<cmd>GpNew<cr>",    mode = { "n", "i" }, desc = "GPT prompt GpNew",    nowait = true },
      { "<C-a>gv", "<cmd>GpVnew<cr>",   mode = { "n", "i" }, desc = "GPT prompt GpVnew",   nowait = true },
      { "<C-a>gt", "<cmd>GpTabnew<cr>", mode = { "n", "i" }, desc = "GPT prompt GpTabnew", nowait = true },

      { "<C-a>gp", ":<C-u>'<,'>GpPopup<cr>",  mode = "v", desc = "GPT prompt Visual Popup",    nowait = true },
      { "<C-a>ge", ":<C-u>'<,'>GpEnew<cr>",   mode = "v", desc = "GPT prompt Visual GpEnew",   nowait = true },
      { "<C-a>gn", ":<C-u>'<,'>GpNew<cr>",    mode = "v", desc = "GPT prompt Visual GpNew",    nowait = true },
      { "<C-a>gv", ":<C-u>'<,'>GpVnew<cr>",   mode = "v", desc = "GPT prompt Visual GpVnew",   nowait = true },
      { "<C-a>gt", ":<C-u>'<,'>GpTabnew<cr>", mode = "v", desc = "GPT prompt Visual GpTabnew", nowait = true },

      { "<C-a>x", "<cmd>GpContext<cr>",       mode = { "n", "i" }, desc = "GPT prompt Toggle Context",        nowait = true },
      { "<C-a>x", ":<C-u>'<,'>GpContext<cr>", mode = "v",          desc = "GPT prompt Visual Toggle Context", nowait = true },

      { "<C-a>s", "<cmd>GpStop<cr>",      mode = { "n", "i", "v", "x" }, desc = "GPT prompt Stop",       nowait = true },
      { "<C-a>n", "<cmd>GpNextAgent<cr>", mode = { "n", "i", "v", "x" }, desc = "GPT prompt Next Agent", nowait = true },

      -- optional Whisper commands with prefix <C-g>w
      { "<C-a>ww", "<cmd>GpWhisper<cr>",       mode = { "n", "i" }, desc = "GPT prompt Whisper",        nowait = true },
      { "<C-a>ww", ":<C-u>'<,'>GpWhisper<cr>", mode = "v",          desc = "GPT prompt Visual Whisper", nowait = true },

      { "<C-a>wr", "<cmd>GpWhisperRewrite<cr>", mode = { "n", "i" }, desc = "GPT prompt Whisper Inline Rewrite",    nowait = true },
      { "<C-a>wa", "<cmd>GpWhisperAppend<cr>",  mode = { "n", "i" }, desc = "GPT prompt Whisper Append (after)",    nowait = true },
      { "<C-a>wb", "<cmd>GpWhisperPrepend<cr>", mode = { "n", "i" }, desc = "GPT prompt Whisper Prepend (before) ", nowait = true },

      { "<C-a>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", mode = "v", desc = "GPT prompt Visual Whisper Rewrite",          nowait = true },
      { "<C-a>wa", ":<C-u>'<,'>GpWhisperAppend<cr>",  mode = "v", desc = "GPT prompt Visual Whisper Append (after)",   nowait = true },
      { "<C-a>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", mode = "v", desc = "GPT prompt Visual Whisper Prepend (before)", nowait = true },

      { "<C-a>wp", "<cmd>GpWhisperPopup<cr>",  mode = { "n", "i" }, desc = "GPT prompt Whisper Popup",  nowait = true },
      { "<C-a>we", "<cmd>GpWhisperEnew<cr>",   mode = { "n", "i" }, desc = "GPT prompt Whisper Enew",   nowait = true },
      { "<C-a>wn", "<cmd>GpWhisperNew<cr>",    mode = { "n", "i" }, desc = "GPT prompt Whisper New",    nowait = true },
      { "<C-a>wv", "<cmd>GpWhisperVnew<cr>",   mode = { "n", "i" }, desc = "GPT prompt Whisper Vnew",   nowait = true },
      { "<C-a>wt", "<cmd>GpWhisperTabnew<cr>", mode = { "n", "i" }, desc = "GPT prompt Whisper Tabnew", nowait = true },

      { "<C-a>wp", ":<C-u>'<,'>GpWhisperPopup<cr>",  mode = "v", desc = "GPT prompt Visual Whisper Popup", nowait = true },
      { "<C-a>we", ":<C-u>'<,'>GpWhisperEnew<cr>",   mode = "v", desc = "GPT prompt Visual Whisper Enew",  nowait = true },
      { "<C-a>wn", ":<C-u>'<,'>GpWhisperNew<cr>",    mode = "v", desc = "GPT prompt Visual Whisper New",   nowait = true },
      { "<C-a>wv", ":<C-u>'<,'>GpWhisperVnew<cr>",   mode = "v", desc = "GPT prompt Visual Whisper Vnew",  nowait = true },
      { "<C-a>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", mode = "v", desc = "GPT prompt Visual Whisper Tabnew",nowait = true },
    },

    config = function()
      --- @module 'gp'
      --- @type GpConfig
      local cfg = {
        -- LLMs
        providers = {
          openrouter = {
            endpoint = 'https://openrouter.ai/api/v1/chat/completions',
            secret = vim.g.OPENROUTER_API_KEY,
          },
        },
        agents = {
          {
            provider = 'openrouter',
            name = 'Claude 3.7 Sonnet',
            chat = true,
            command = true,
            model = 'anthropic/claude-3.7-sonnet',
            system_prompt = require('gp.defaults').code_system_prompt,
          },
          {
            provider = 'openrouter',
            name = 'Gemini 2.5 Pro',
            chat = true,
            command = true,
            -- string with model name or table with model name and parameters
            model = 'google/gemini-2.5-pro-preview-03-25',
            system_prompt = require('gp.defaults').code_system_prompt,
          },
          {
            provider = 'openrouter',
            name = 'Gemini 2.5 Flash',
            chat = true,
            command = true,
            -- string with model name or table with model name and parameters
            model = 'google/gemini-2.5-flash-preview',
            system_prompt = require('gp.defaults').code_system_prompt,
          },

          -- Disable defaults
          { name = 'ChatGPT4o', disable = true },
          { name = 'ChatGPT4o-mini', disable = true },
          { name = 'ChatGPT-o3-mini', disable = true },
          { name = 'CodeGPT4o', disable = true },
          { name = 'CodeGPT-o3-mini', disable = true },
          { name = 'CodeGPT4o-mini', disable = true },
        },

        -- Speech to Text
        openai_api_key = vim.g.OPENAI_API_KEY,
      }

      require('gp').setup(cfg)
    end,
  },
}
