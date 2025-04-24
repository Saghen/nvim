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
      { "<C-a>c", "<cmd>GpChatNew<cr>",    mode = { "n", "i" }, desc = "New Chat",    nowait = true },
      { "<C-a>t", "<cmd>GpChatToggle<cr>", mode = { "n", "i" }, desc = "Toggle Chat", nowait = true },
      { "<C-a>f", "<cmd>GpChatFinder<cr>", mode = { "n", "i" }, desc = "Chat Finder", nowait = true },

      { "<C-a>c", ":<C-u>'<,'>GpChatNew<cr>",    mode = "v", desc = "Chat New",    nowait = true },
      { "<C-a>p", ":<C-u>'<,'>GpChatPaste<cr>",  mode = "v", desc = "Chat Paste",  nowait = true },
      { "<C-a>t", ":<C-u>'<,'>GpChatToggle<cr>", mode = "v", desc = "Toggle Chat", nowait = true },

      { "<C-a><C-x>", "<cmd>GpChatNew split<cr>",  mode = { "n", "i" }, desc = "New Chat Horizontal Split",  nowait = true },
      { "<C-a><C-v>", "<cmd>GpChatNew vsplit<cr>", mode = { "n", "i" }, desc = "New Chat Vertical Split", nowait = true },
      { "<C-a><C-t>", "<cmd>GpChatNew tabnew<cr>", mode = { "n", "i" }, desc = "New Chat Tab", nowait = true },

      { "<C-a><C-x>", ":<C-u>'<,'>GpChatNew split<cr>",  mode = "v", desc = "Chat New Horizontal Split",  nowait = true },
      { "<C-a><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", mode = "v", desc = "Chat New Vertical Split", nowait = true },
      { "<C-a><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", mode = "v", desc = "Chat New Tab", nowait = true },

      -- Prompt commands
      { "<C-a>r", "<cmd>GpRewrite<cr>", mode = { "n", "i" }, desc = "Inline Rewrite",   nowait = true },
      { "<C-a>a", "<cmd>GpAppend<cr>",  mode = { "n", "i" }, desc = "Append (after)",   nowait = true },
      { "<C-a>b", "<cmd>GpPrepend<cr>", mode = { "n", "i" }, desc = "Prepend (before)", nowait = true },

      { "<C-a>r", ":<C-u>'<,'>GpRewrite<cr>",   mode = "v",  desc = "Visual Rewrite",          nowait = true },
      { "<C-a>a", ":<C-u>'<,'>GpAppend<cr>",    mode = "v",  desc = "Visual Append (after)",   nowait = true },
      { "<C-a>b", ":<C-u>'<,'>GpPrepend<cr>",   mode = "v",  desc = "Visual Prepend (before)", nowait = true },
      { "<C-a>i", ":<C-u>'<,'>GpImplement<cr>", mode = "v",  desc = "Implement selection",     nowait = true },

      { "<C-a>gp", "<cmd>GpPopup<cr>",  mode = { "n", "i" }, desc = "Prompt Popup",    nowait = true },
      { "<C-a>ge", "<cmd>GpEnew<cr>",   mode = { "n", "i" }, desc = "Prompt Replace",   nowait = true },
      { "<C-a>gn", "<cmd>GpNew<cr>",    mode = { "n", "i" }, desc = "Prompt Horizontal Split",    nowait = true },
      { "<C-a>gv", "<cmd>GpVnew<cr>",   mode = { "n", "i" }, desc = "Prompt Vertical Split",   nowait = true },
      { "<C-a>gt", "<cmd>GpTabnew<cr>", mode = { "n", "i" }, desc = "Prompt Tab", nowait = true },

      { "<C-a>gp", ":<C-u>'<,'>GpPopup<cr>",  mode = "v", desc = "Visual Popup",    nowait = true },
      { "<C-a>ge", ":<C-u>'<,'>GpEnew<cr>",   mode = "v", desc = "Visual Replace",   nowait = true },
      { "<C-a>gn", ":<C-u>'<,'>GpNew<cr>",    mode = "v", desc = "Visual Horizontal Split",    nowait = true },
      { "<C-a>gv", ":<C-u>'<,'>GpVnew<cr>",   mode = "v", desc = "Visual Vertical Split",   nowait = true },
      { "<C-a>gt", ":<C-u>'<,'>GpTabnew<cr>", mode = "v", desc = "Visual Tab", nowait = true },

      { "<C-a>x", "<cmd>GpContext<cr>",       mode = { "n", "i" }, desc = "Toggle Context", nowait = true },
      { "<C-a>x", ":<C-u>'<,'>GpContext<cr>", mode = "v",          desc = "Toggle Context", nowait = true },

      { "<C-a>s", "<cmd>GpStop<cr>",      mode = { "n", "i", "v", "x" }, desc = "Stop",       nowait = true },
      { "<C-a>n", "<cmd>GpNextAgent<cr>", mode = { "n", "i", "v", "x" }, desc = "Next Agent", nowait = true },

      -- Speech to Text (Whisper)
      { "<C-a>ww", "<cmd>GpWhisper<cr>",       mode = { "n", "i" }, desc = "Whisper",        nowait = true },
      { "<C-a>ww", ":<C-u>'<,'>GpWhisper<cr>", mode = "v",          desc = "Visual Whisper", nowait = true },

      { "<C-a>wr", "<cmd>GpWhisperRewrite<cr>", mode = { "n", "i" }, desc = "Whisper Inline Rewrite",    nowait = true },
      { "<C-a>wa", "<cmd>GpWhisperAppend<cr>",  mode = { "n", "i" }, desc = "Whisper Append (after)",    nowait = true },
      { "<C-a>wb", "<cmd>GpWhisperPrepend<cr>", mode = { "n", "i" }, desc = "Whisper Prepend (before)", nowait = true },

      { "<C-a>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", mode = "v", desc = "Whisper Rewrite",          nowait = true },
      { "<C-a>wa", ":<C-u>'<,'>GpWhisperAppend<cr>",  mode = "v", desc = "Whisper Append (after)",   nowait = true },
      { "<C-a>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", mode = "v", desc = "Whisper Prepend (before)", nowait = true },

      { "<C-a>wp", "<cmd>GpWhisperPopup<cr>",  mode = { "n", "i" }, desc = "Whisper Popup",  nowait = true },
      { "<C-a>we", "<cmd>GpWhisperEnew<cr>",   mode = { "n", "i" }, desc = "Whisper Replace",   nowait = true },
      { "<C-a>wn", "<cmd>GpWhisperNew<cr>",    mode = { "n", "i" }, desc = "Whisper Horizontal Split",    nowait = true },
      { "<C-a>wv", "<cmd>GpWhisperVnew<cr>",   mode = { "n", "i" }, desc = "Whisper Vertical Split",   nowait = true },
      { "<C-a>wt", "<cmd>GpWhisperTabnew<cr>", mode = { "n", "i" }, desc = "Whisper Tab", nowait = true },

      { "<C-a>wp", ":<C-u>'<,'>GpWhisperPopup<cr>",  mode = "v", desc = "Whisper Popup", nowait = true },
      { "<C-a>we", ":<C-u>'<,'>GpWhisperEnew<cr>",   mode = "v", desc = "Whisper Replace",  nowait = true },
      { "<C-a>wn", ":<C-u>'<,'>GpWhisperNew<cr>",    mode = "v", desc = "Whisper Horizontal Split",   nowait = true },
      { "<C-a>wv", ":<C-u>'<,'>GpWhisperVnew<cr>",   mode = "v", desc = "Whisper Vertical Split",  nowait = true },
      { "<C-a>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", mode = "v", desc = "Whisper Tab",nowait = true },
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
