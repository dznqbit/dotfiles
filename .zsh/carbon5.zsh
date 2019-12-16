# Carbon Five-specific environment settings

# Android
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

# Reference Java 8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home

# Postgres - point to Docker
export PGPASSWORD=admin
export PGHOST=localhost
export PGUSER=admin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Babylon
vault-login() {
  VAULT_ADDR="$(yq -y ".regions | map(select(.name == \"$1\") .vault)" < ${SHIPCAT_MANIFEST_DIR}/shipcat.conf | yq '.[0].url' -r)"
  export VAULT_ADDR
  if [[ $VAULT_ADDR = "https://vault.babylontech.co.uk:8200" ]]; then
    export VAULT_TOKEN=${BABYLON_LEGACY_VAULT_TOKEN}
  else
    unset VAULT_TOKEN
    vault login -method=github token="${BABYLON_GITHUB_PAT}"
  fi
}
