{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-eft";
      src = pkgs.fetchFromGitHub {
        owner = "hrsh7th";
        repo = "vim-eft";
        rev = "419deb0c45141c11cfd2648b8523f520f8413ec2";
        hash = "sha256-Gi9onX/pSIxjtOsXgYUxJtvY6boKcicAkchIwP6K12Q=";
      };
    })
  ];

  keymaps = [
    {
      key = ";";
      action = "<Plug>(eft-repeat)";
    }
    {
      mode = "x";
      key = ";";
      action = "<Plug>(eft-repeat)";
    }
    {
      mode = "o";
      key = ";";
      action = "<Plug>(eft-repeat)";
    }

    {
      key = "f";
      action = "<Plug>(eft-f)";
    }
    {
      mode = "x";
      key = "f";
      action = "<Plug>(eft-f)";
    }
    {
      mode = "o";
      key = "f";
      action = "<Plug>(eft-f)";
    }
    {
      key = "F";
      action = "<Plug>(eft-F)";
    }
    {
      mode = "x";
      key = "F";
      action = "<Plug>(eft-F)";
    }
    {
      mode = "o";
      key = "F";
      action = "<Plug>(eft-F)";
    }

    {
      key = "t";
      action = "<Plug>(eft-t)";
    }
    {
      mode = "x";
      key = "t";
      action = "<Plug>(eft-t)";
    }
    {
      mode = "o";
      key = "t";
      action = "<Plug>(eft-t)";
    }
    {
      key = "T";
      action = "<Plug>(eft-T)";
    }
    {
      mode = "x";
      key = "T";
      action = "<Plug>(eft-T)";
    }
    {
      mode = "o";
      key = "T";
      action = "<Plug>(eft-T)";
    }
  ];
}
