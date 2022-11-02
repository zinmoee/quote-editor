role :app, %w{ec2-user@ip-172-31-39-154}
role :web, %w{ec2-user@ip-172-31-39-154}
role :db,  %w{ec2-user@ip-172-31-39-154}
set :ssh_options, {
   keys: %w(/Users/zin/.ssh/ecs-rails-key.pem),
   forward_agent: false,
   auth_methods: %w(publickey password)
 }