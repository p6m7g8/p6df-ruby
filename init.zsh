p6df::modules::ruby::version() { echo "0.0.1" }
p6df::modules::ruby::deps()    {
	ModuleDeps=(
	)
}

p6df::modules::ruby::external::brew() {
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

  env_version "rb"
}
