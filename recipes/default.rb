#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2'
include_recipe 'mysql::server'
include_recipe 'mysql::client'
include_recipe 'php'
include_recipe 'php::module_mysql'
include_recipe 'vim'
include_recipe 'sendmail'


apache_mod 'php5'