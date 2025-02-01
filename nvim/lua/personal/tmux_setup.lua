-- Check if inside tmux session
if vim.fn.getenv('TMUX') ~= '' then
   -- Function to execute tmux commands more efficiently
   local set_tmux_status = function(status)
      vim.fn.system("tmux set-option status " .. status)
   end

   -- Hide tmux status bar when entering Neovim (faster approach)
   vim.api.nvim_create_autocmd("VimEnter", {
      callback = function() set_tmux_status("off") end
   })

   -- Show tmux status bar when leaving or suspending Neovim
   vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
      callback = function() set_tmux_status("on") end
   })
end
