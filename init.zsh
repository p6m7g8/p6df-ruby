p6df::modules::ruby::version() { echo "0.0.1" }
p6df::modules::ruby::deps()    {
	ModuleDeps=(
	)
}

p6df::modules::ruby::external::brew() {
}

p6df::modules::ruby::init() {

#  p6df::modules::ruby::rbenv::init
}

p6df::modules::ruby::rbenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    RBENV_ROOT=/Users/pgollucci/.local/share/rbenv/rbenv

    if [ -x $RBENV_ROOT/bin/rbenv ]; then
      export RBENV_ROOT
      export HAS_RBENV=1

      p6dfz::util::path_if $RBENV_ROOT/bin
      eval "$(rbenv init - zsh)"
    fi
}

p6df::prompt::ruby::line() {

  env_version "rb"
}

p6df::modules::ruby::init
