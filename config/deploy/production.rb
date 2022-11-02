role :app, %w{ubuntu@ip-172-31-46-26}
role :web, %w{ubuntu@ip-172-31-46-26}
role :db,  %w{ubuntu@ip-172-31-46-26}
set :ssh_options, {
   keys: %w(/Users/zin/.ssh/ecs-rails-key.pem),
   forward_agent: false,
   auth_methods: %w(publickey password)
 }