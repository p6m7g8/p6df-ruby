p6df::modules::ruby::version() { echo "0.0.1" }
p6df::modules::ruby::deps()    { 
	ModuleDeps=(
	)
}

p6df::modules::ruby::external::brew() {
}

p6df::modules::ruby::init() {

  p6df::modules::ruby::rbenv::init
}

p6df::modules::ruby::rbenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    export RBENV_ROOT=/Users/pgollucci/.local/share/rbenv/rbenv
    p6dfz::util::path_if $RBENV_ROOT/bin

    if [ -x $RBENV_ROOT/bin/rbenv ]; then
      export HAS_RBENV=1
      eval "$(rbenv init - zsh)"
    fi
}

p6df::prompt::ruby::line() {

  env_version "rb"
}

p6df::modules::ruby::init
