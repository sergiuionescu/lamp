case node['platform']
when 'ubuntu'
  apt_repository 'ondrej-php' do
    uri          'ppa:ondrej/php'
    distribution node['lsb']['codename']
    only_if { node['php']['version'] >= '7' }
  end
else
  include_recipe 'yum-remi-chef::remi-php70'
end
