######################################################################
#<
#
# Function: p6df::modules::ruby::version()
#
#>
######################################################################
p6df::modules::ruby::version() { echo "0.0.1" }
######################################################################
#<
#
# Function: p6df::modules::ruby::deps()
#
#>
######################################################################
p6df::modules::ruby::deps() { 
	ModuleDeps=( 
		rbenv/rbenv
		rbenv/ruby-build
	) 
}

######################################################################
#<
#
# Function: p6df::modules::ruby::home::symlink()
#
#>
######################################################################
p6df::modules::ruby::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/p6m7g8/p6df-ruby/share/.gemrc .gemrc
  ln -fs $P6_DFZ_SRC_DIR/p6m7g8/p6df-ruby/share/.gemrc .riplrc

  mkdir -p $P6_DFZ_SRC_DIR/rbenv/rbenv/plugins
  ln -fs $P6_DFZ_SRC_DIR/rbenv/ruby-build $P6_DFZ_SRC_DIR/rbenv/rbenv/plugins/ruby-build
}

######################################################################
#<
#
# Function: p6df::modules::ruby::langs()
#
#>
######################################################################
p6df::modules::ruby::langs() {

  rbenv install 2.6.5
  rbenv global 2.6.5

  rbenv rehash
}

######################################################################
#<
#
# Function: p6df::modules::ruby::init()
#
#>
######################################################################
p6df::modules::ruby::init() {

  p6df::modules::ruby::rbenv::init "$P6_DFZ_SRC_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::ruby::rbenv::init(dir)
#
#  Args:
#	dir - 
#
#>
######################################################################
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

######################################################################
#<
#
# Function: p6df::prompt::ruby::line()
#
#>
######################################################################
p6df::prompt::ruby::line() {

  p6_ruby_prompt_info
}

######################################################################
#<
#
# Function: p6_ruby_prompt_info()
#
#>
######################################################################
p6_ruby_prompt_info() {

  p6_lang_version "rb"
}