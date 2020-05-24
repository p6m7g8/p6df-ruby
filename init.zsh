p6df::modules::ruby::version() { echo "0.0.1" }
p6df::modules::ruby::deps() { 
	ModuleDeps=( 
		rbenv/rbenv
		rbenv/ruby-build
	) 
}

p6df::modules::ruby::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/p6m7g8/p6df-ruby/share/.gemrc .gemrc
  ln -fs $P6_DFZ_SRC_DIR/p6m7g8/p6df-ruby/share/.gemrc .riplrc

  mkdir -p $P6_DFZ_SRC_DIR/rbenv/rbenv/plugins
  ln -fs $P6_DFZ_SRC_DIR/rbenv/ruby-build $P6_DFZ_SRC_DIR/rbenv/rbenv/plugins/ruby-build
}

p6df::modules::ruby::langs() {

  rbenv install 2.6.5
  rbenv global 2.6.5

  rbenv rehash
}

p6df::modules::ruby::init() {

  p6df::modules::ruby::rbenv::init "$P6_DFZ_SRC_DIR"
}

p6df::modules::ruby::rbenv::init() {
  local dir="$1"

  [ -n "$DISABLE_ENVS" ] && return

  RBENV_ROOT=$dir/rbenv/rbenv

  if [ -x $RBENV_ROOT/bin/rbenv ]; then
    export RBENV_ROOT
    export HAS_RBENV=1

    p6df::util::path_if $RBENV_ROOT/bin
    eval "$(rbenv init - zsh)"
  fi
}

p6df::prompt::ruby::line() {

  p6_ruby_prompt_info
}

p6_ruby_prompt_info() {

  p6_lang_version "rb"
}

