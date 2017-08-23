case node['platform']
when 'centos'
  include_recipe 'yum-mysql-community::mysql57'
end
