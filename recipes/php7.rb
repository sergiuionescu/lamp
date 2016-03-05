if node['php']['version'] >= '7'
  apt_repository 'ondrej-php' do
    uri          'ppa:ondrej/php'
    distribution node['lsb']['codename']
  end
end