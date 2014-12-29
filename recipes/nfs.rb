#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'nfs::server'

nfs_export "/var/www" do
  network '192.168.3.0/24'
  writeable true
  anonuser 'vagrant'
  anongroup 'vagrant'
  sync true
  options ['no_root_squash']
end