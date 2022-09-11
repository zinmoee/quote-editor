# README

* Source
https://www.hotrails.dev/turbo-rails/css-ruby-on-rails

### RDS in bastion
- mysql -h zinmoe-testing.c5em1aikdxab.ap-southeast-1.rds.amazonaws.com -u zinmoe -p

- U - zinmoe
- P - password


### Get Login Password
- aws ecr get-login-password


### AWS Login
- aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 491236099115.dkr.ecr.ap-southeast-1.amazonaws.com


### Tag image
- docker tag b5209a79df2c 491236099115.dkr.ecr.ap-southeast-1.amazonaws.com/quote-editor:latest


### Push image
- docker push 491236099115.dkr.ecr.ap-southeast-1.amazonaws.com/quote-editor:latest
