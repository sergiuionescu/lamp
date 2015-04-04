#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

php_pear "xdebug" do
  zend_extensions ['xdebug.so']
  version node['lamp']['xdebug']['version']
  action :install
  directives node['lamp']['xdebug']['directives']
end

case node['platform']
  when 'ubuntu'
    execute "create xdebug conf symlinks" do
      command "php5enmod xdebug"
      only_if { node['platform_version'].to_f >= 12.10 }
    end
end