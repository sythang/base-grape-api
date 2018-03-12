
server "172.104.170.135", user: "vinova", roles: %w{app db web}
set :deploy_via, :remote_cache
set :branch, "staging"

server "172.104.170.135",
  user: "vinova",
  roles: %w{web app db},
  primary: true
  
set :ssh_options, {
  forward_agent: true,
	auth_methods: %w(publickey),
	user: 'vinova',
}
set :conditionally_migrate, true

# set :linked_files, fetch(:linked_files, []).push('.env.staging')