# Carbon Five-specific environment settings

# Add Android SDK to $PATH
export ANDROID_SDK=$HOME/Library/Android/sdk
#
# required for Cleo-app
export PATH=$ANDROID_SDK/emulator:$PATH

# Reference Java 8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home

# Postgres - point to Docker
export PGPASSWORD=admin
export PGHOST=localhost
export PGUSER=admin

# Cleo aliases
alias cleo-lint='pipenv run flake8'
alias cleo-makemigrations="pipenv run python manage.py makemigrations"
alias cleo-migrate="pipenv run python manage.py migrate"
alias cleo-server="pipenv run python manage.py runserver"
alias cleo-shell="pipenv run python manage.py shell"
alias cleo-sql='psql lucy admin'
alias cleo-test="pipenv run python manage.py test"
alias cleo-dev="tmux-cleo"
