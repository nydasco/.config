
#Lendi
set -gx AIRFLOW_SNOWFLAKE_DEV_DATABASE "LENDI_DWH_DEV_ANDY_SAWYER"
set -gx DBT_USER "USR_LENDI_ANDY_SAWYER_DEV"
set -gx DBT_ROLE "DB_ROLE_OWNER_LENDI_DWH_DEV_ANDY_SAWYER"
set -gx SNOWFLAKE_PRIVATE_KEY "~/.ssh/snowflake_rsa_key.p8"

#set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -gx FZF_DEFAULT_COMMAND 'fd --type file --hidden --no-ignore'
set -gx FZF_DEFAULT_OPTS '--reverse --border --height 60%'
set -gx EDITOR "/usr/bin/nvim"
