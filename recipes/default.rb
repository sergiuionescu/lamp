#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2'
include_recipe 'lamp::php7'
include_recipe 'php'
include_recipe 'php::module_gd'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_fcgi'
include_recipe 'vim'
include_recipe 'sendmail'
include_recipe 'cron'
include_recipe "composer"

git_client 'default' do
  action :install
end

mysql_service 'default' do
  bind_address node['lamp']['mysql']['bind_address']
  port '3306'
  data_dir '/data'
  initial_root_password node['lamp']['mysql']['root_password']
  action [:create, :start]
end

package 'php5-mysql' do
  action :install
end

php_fpm_pool 'default' do
  action :install
end

