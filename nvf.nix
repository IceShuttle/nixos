{
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        utility.smart-splits.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamed";
        };
        opts = {
          mouse = "a";
          shell = "${pkgs.zsh}/bin/zsh";
        };
        terminal.toggleterm = {
          enable = true;
          mappings.open = "<c-/>";
          lazygit.enable = true;
        };
        viAlias = false;
        vimAlias = true;
        undoFile.enable = true;
        statusline.lualine.enable = true;
        filetree.neo-tree.enable = true;
        tabline.nvimBufferline.enable = true;
        git.enable = true;
        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };
        telescope = {
          enable = true;
          mappings = {
            lspDocumentSymbols = "<leader>ss";
            lspReferences = "<leader>gr";
          };
        };
        diagnostics = {
          enable = true;
        };
        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          lightbulb.enable = true;
          mappings = {
            hover = "K";
            goToDefinition = "<leader>gd";
            goToDeclaration = "<leader>gD";
            renameSymbol = "<leader>cr";
          };
        };
        languages = {
          enableTreesitter = true;
          enableFormat = true;
          nix = {
            enable = true;
            lsp.servers = ["nixd"];
          };
          rust.enable = true;
          toml.enable = true;
          python.enable = true;
          json.enable = true;
          docker.enable = true;
          clang.enable = true;
          bash.enable = true;
          markdown.enable = true;
          yaml.enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        treesitter = {
          enable = true;
          highlight.enable = true;
          fold = false;
        };
      };
    };
  };
}
