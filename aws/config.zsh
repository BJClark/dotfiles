# AWS Configuration

# Use aws-vault for credential management
export AWS_VAULT_BACKEND=keychain
export AWS_VAULT_PROMPT=osascript

# Default region
export AWS_DEFAULT_REGION=us-west-2

# Enable AWS CLI auto-completion
autoload -U +X bashcompinit && bashcompinit
complete -C '/opt/homebrew/bin/aws_completer' aws

# Useful AWS aliases
alias awsv="aws-vault"
alias awslogin="aws-vault login"
alias awsexec="aws-vault exec"
alias awslist="aws-vault list"
alias awsclear="aws-vault clear"

# Profile management
alias awsp="aws-vault exec --"
alias awsdev="aws-vault exec dev --"
alias awsprod="aws-vault exec prod --"
alias awsstaging="aws-vault exec staging --"

# Resource management shortcuts
alias ec2ls="aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,State.Name,Tags[?Key==\`Name\`].Value[]|[0],InstanceType,PublicIpAddress,PrivateIpAddress]' --output table"
alias s3ls="aws s3 ls"
alias cfnls="aws cloudformation list-stacks --query 'StackSummaries[?StackStatus!=`DELETE_COMPLETE`].[StackName,StackStatus,CreationTime]' --output table" 