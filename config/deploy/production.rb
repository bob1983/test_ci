set :linked_files, fetch(:linked_files, []).push('.env.production')
server "ec2-52-197-115-194.ap-northeast-1.compute.amazonaws.com", user: "ec2-user", roles: %w{app db web}
set :ssh_options, keys: "~/.ssh/bob-key_pair-TOKYO.pem"
