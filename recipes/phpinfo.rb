execute "create phpinfo directory" do
  command "mkdir -p /var/www/phpinfo"
  not_if "ls /var/www/phpinfo"
end

execute "create phpinfo file" do
  command "echo '<?php phpinfo();' > /var/www/phpinfo/index.php"
  not_if "ls /var/www/phpinfo/index.php"
end

execute "set phpinfo permissions" do
  command "chown #{node['apache']['user']}:#{node['apache']['group']} -R /var/www/phpinfo"
end

web_app 'phpinfo' do
  template 'lamp.conf.erb'
  docroot '/var/www/phpinfo'
  server_name 'phpinfo.local'
end