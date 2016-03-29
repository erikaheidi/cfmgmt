#custom attribute(works as global variable)
node.default['main']['doc_root'] = "/vagrant/web"

#executes apt-get update
execute "apt-get update" do
  command "apt-get update"
end

#install Apache
apt_package "apache2" do
  action :install
end

#define the Apache service
service "apache2" do
  action [ :enable, :start ]
end

#create doc root directory
directory node['main']['doc_root'] do
  owner 'www-data'
  group 'www-data'
  mode '0644'
  action :create
end

#copy index html file
cookbook_file "#{node['main']['doc_root']}/index.html" do
  source 'index.html'
  owner 'www-data'
  group 'www-data'
  action :create
end

#set vhost template
template "/etc/apache2/sites-available/000-default.conf" do
  source "vhost.erb"
  variables({ :doc_root => node['main']['doc_root'] })
  action :create
  notifies :restart, resources(:service => "apache2")
end