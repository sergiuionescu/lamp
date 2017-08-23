
default['lamp']['xdebug']['directives'] = {}

default['lamp']['share']['user'] = 'root'
default['lamp']['share']['group'] = 'root'

default['lamp']['xdebug']['version'] = '2.3.2';

default['lamp']['mysql']['root_password'] = 'root';
default['lamp']['mysql']['bind_address'] = '0.0.0.0';
case node['platform']
when 'centos'
  default['lamp']['mysql']['version'] = '5.7';
else
  default['lamp']['mysql']['version'] = '5.6';
end
