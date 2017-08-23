#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2'
include_recipe 'lamp::mysql'
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
  version node['lamp']['mysql']['version']
end

php_fpm_pool 'default' do
  listen '127.0.0.1:9000'
  action :install
end

