#
# Cookbook Name:: php-spawn-fcgi
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service 'php-fcgi' do
  action :nothing
end

template '/etc/rc.d/init.d/php-fcgi' do
  source 'php-fcgi.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  
  notifies :enable, 'service[php-fcgi]'
  notifies :start, 'service[php-fcgi]'
end