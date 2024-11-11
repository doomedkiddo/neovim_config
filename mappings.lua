require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- 定义快捷键 关闭当前分割窗口
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })

-- 定义快捷键 保存文件
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- ClangFormat
vim.api.nvim_set_keymap('n', '<Leader>cl', ':ClangFormat<CR>', { noremap = true, silent = true })

-- 删除光标所在单词
vim.api.nvim_set_keymap('n', 'XE', 'daw', { noremap = true, silent = true })

-- 关闭 TAB
vim.api.nvim_set_keymap('n', 'tabc', ':tabc <CR>', { noremap = true, silent = true })

-- 跳转到上一个 TAB
vim.api.nvim_set_keymap('n', 'gp', ':tabp <CR>', { noremap = true, silent = true })

-- 定义快捷键 跳转到光标所在关键词的定义处
vim.api.nvim_set_keymap('n', '<Leader>gt', 'g<C-]>', { noremap = true, silent = true })

-- 定义快捷键 跳回原关键词 与 ;gr 配合使用
vim.api.nvim_set_keymap('n', '<Leader>gr', '<C-T>', { noremap = true, silent = true })


-- 快速移动到行首，行尾
vim.api.nvim_set_keymap('n', '<Leader>1', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>2', '$', { noremap = true, silent = true })

-- 快速切换C H源文件
vim.api.nvim_set_keymap('n', '<Leader>a', ':A<CR>', { noremap = true, silent = true })

-- 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
vim.api.nvim_set_keymap('n', '<Leader>gg', '<C-W><C-W>', { noremap = true, silent = true })

-- 向左
vim.api.nvim_set_keymap('n', '<leader>h', '<C-W><C-H>', { noremap = true, silent = true })

-- 向右
vim.api.nvim_set_keymap('n', '<leader>l', '<C-W><C-L>', { noremap = true, silent = true })

-- 向上
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-W><C-K>', { noremap = true, silent = true })

-- 向下
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-W><C-J>', { noremap = true, silent = true })

-- 打开文件
vim.api.nvim_set_keymap('n', '<Leader>e', ':e<Space>', { noremap = true, silent = true })

-- 不关闭文件退出
vim.api.nvim_set_keymap('n', '<Leader>z', '<C-Z>', { noremap = true, silent = true })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- align 表格对齐
vim.api.nvim_set_keymap('n', '<Leader>t', ':Tab /<CR>', { noremap = true, silent = true })

-- 打tag
vim.api.nvim_set_keymap('n', '<leader>tg', ':!ctags -R --fields=+aS --extra=+q<CR>', { noremap = true, silent = true })

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>n", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- mappings.lua

-- 快速搜索当前光标下的单词
-- 使用TlistToggle查看文件函数列表。设置快捷键
-- vim.api.nvim_set_keymap('n', '<Leader>m', ':TlistToggle <CR>', { noremap = true, silent = true })

-- 粘贴到系统剪切板
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', { noremap = true, silent = true })

-- 编译快捷键
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "nnoremap <F1> :w <bar> exec '!python '.shellescape('%')<CR>"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  command = "nnoremap <F1> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = "nnoremap <F1> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dot",
  command = "nnoremap <F1> :w <bar> exec '!dot -Tsvg sqlparse.dot > sqlparse.svg'<CR>"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  command = "nnoremap <F1> :w <bar> exec '!javac '.shellescape('%'). ' -d ./bin'<CR>"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  command = "nnoremap <F2> :w <bar> exec '!java -cp ./bin '.shellescape('%:r')<CR>"
})
vim.api.nvim_set_keymap('n', '<leader>fa', ':lua require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })<CR>', { noremap = true, silent = true })
