#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2'
include_recipe 'apache2::mod_php5'
include_recipe 'mysql::server'
include_recipe 'mysql::client'
include_recipe 'php'
include_recipe 'vim'
include_recipe 'sendmail'

package "php5-mysql" do
  action :install
end

php_pear "xdebug" do
  zend_extensions ['xdebug.so']
  action :install
  directives node['lamp']['xdebug']['directives']
end

case node['platform']
  when 'ubuntu'
    if node['platform_version'].to_f >= 12.10
      execute "create xdebug conf symlinks" do
        command "php5enmod xdebug"
      end
end
end