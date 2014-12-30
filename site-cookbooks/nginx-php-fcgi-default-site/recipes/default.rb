#
# Cookbook Name:: nginx-php-fcgi-default-site
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service 'nginx' do
  action :nothing
end

file "#{node['nginx']['dir']}/sites-enabled/000-default" do
  action :delete
end

template 'fcgi-php' do
  source 'fcgi-php.erb'
  path "#{node['nginx']['dir']}/sites-available/fcgi-php"
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

link '001-fcgi-php' do
  to "#{node['nginx']['dir']}/sites-available/fcgi-php"
  target_file "#{node['nginx']['dir']}/sites-enabled/001-fcgi-php"
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  
  notifies :restart, 'service[nginx]'
end

template '/var/www/html/index.php' do
  source 'index.php.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end