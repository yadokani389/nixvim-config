final: prev: {
  typos-lsp = prev.typos-lsp.overrideAttrs (old: rec {
    version = "0.1.24";
    src = prev.fetchFromGitHub {
      owner = "tekumara";
      repo = "typos-lsp";
      rev = "refs/tags/v${version}";
      hash = "sha256-Hr9EQGbcz/N1eVxhwZu0+TQpmxBlCYu4mTSxO8e5mpI=";
    };
    # cargoHash = "sha256-plbFuDQwTtvlzfmoR6d/RehJdAo2/lLI+UnXiCdwfB4=";
    cargoDeps = old.cargoDeps.overrideAttrs (prev.lib.const {
      inherit src;
      outputHash = "sha256-bULcMnKTHMdSigMoEK3VqiWtWGplc82iVKsPjynP9OU=";
    });
  });
}
