{-# LANGUAGE OverloadedStrings #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
                -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy
              )

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "johanhaleby/kubetail"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "mafredri/zsh-async"
  , (bundle "denysdovhan/spaceship-prompt") { sourcingStrategy = antigenSourcingStrategy }
  , (bundle "zsh-users/zsh-history-substring-search") { sourcingStrategy = antigenSourcingStrategy }
  , (bundle "zsh-users/zsh-autosuggestions") { sourcingStrategy = antigenSourcingStrategy }
  , (bundle "johanhaleby/kubetail") { sourcingStrategy = antigenSourcingStrategy }

  -- If you use a plugin that doesn't have a *.plugin.zsh file. You can set a
  -- more liberal sourcing strategy.
  --
  -- , (bundle "some/stupid-plugin") { sourcingStrategy = antigenSourcingStrategy }

  -- If you use a plugin that has sub-plugins. You can specify that as well
  --
  -- NOTE: If you want to use oh-my-zsh for real (please don't), you still need
  -- to set the $ZSH env var manually.
  -- , (bundle "robbyrussell/oh-my-zsh")
  --     { sourcingStrategy = filePathsSourcingStrategy
  --                           [ "lib/clipboard.zsh"
  --                           , "lib/compfix.zsh"
  --                           , "lib/completion.zsh"
  --                           , "lib/diagnostics.zsh"
  --                           , "lib/directories.zsh"
  --                           , "lib/functions.zsh"
  --                           , "lib/git.zsh"
  --                           , "lib/grep.zsh"
  --                           , "lib/history.zsh"
  --                           , "lib/key-bindings.zsh"
  --                           , "lib/misc.zsh"
  --                           , "lib/nvm.zsh"
  --                           , "lib/prompt_info_functions.zsh"
  --                           , "lib/spectrum.zsh"
  --                           , "lib/termsupport.zsh"
  --                           , "lib/theme-and-appearance.zsh"
  --                           , "plugins/virtualenv/virtualenv.plugin.zsh"
  --                           , "plugins/git/git.plugin.zsh"
  --                           , "plugins/gitfast/gitfast.plugin.zsh"
  --                           , "plugins/mercurial/mercurial.plugin.zsh"
  --                           , "plugins/nvm/nvm.plugin.zsh"
  --                           , "plugins/systemd/systemd.plugin.zsh"
  --                           , "plugins/composer/composer.plugin.zsh"
  --                           ]}
  
  -- , (bundle "caiogondim/bullet-train.zsh")
  --     { sourcingStrategy = filePathsSourcingStrategy
  --                            [ "bullet-train.zsh-theme"
  --                            ] }

  -- Sourcing a list of files
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = filePathsSourcingStrategy
  --                          [ "vi/zle_vi_visual.zsh"
  --                          , "pytest/pytest.plugin.zsh"
  --                          ] }

  -- Alternatively, this way will give you the same result
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = antigenSourcingStrategy
  --    , sourcingLocations = [ "vi"
  --                          , "pytest"
  --                          ] }

  -- vvv    Add your plugins here    vvv
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
