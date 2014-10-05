#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'build-essential::default'
include_recipe 'apt::default'
include_recipe 'apache2::default'
include_recipe 'mysql::server'
include_recipe 'mysql::default'
include_recipe 'php::default'
include_recipe 'php::module_mysql'
include_recipe 'vim::default'
include_recipe 'sendmail::default'
