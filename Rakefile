#!/usr/bin/env rake

task :default => 'foodcritic'

desc "Runs foodcritic linter"
task :foodcritic do
  Rake::Task[:prepare_sandbox].execute

  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sh "foodcritic -f any #{sandbox_path}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

desc "Runs knife cookbook test"
task :knife do
  Rake::Task[:prepare_sandbox].execute

  sh "bundle exec knife cookbook test cookbook -c test/.chef/knife.rb -o #{sandbox_path}/../"
end

desc "Runs chef solo"
task :solo do
  sh "sudo berks install"
  sh "sudo berks vendor /tmp/cookbooks"
  sh "sudo cp -r ../lamp /tmp/cookbooks/"
  sh "sudo ls /home/travis/.berkshelf/cookbooks/"
  sh "sudo chef-solo -c test/.chef/solo.rb -j test/.chef/$RUNLIST"
  sh "php -v"
  sh "service mysql-default status| grep running"
  sh "service apache2 status| grep running"
end

task :prepare_sandbox do
  files = %w{*.md *.rb attributes definitions files libraries providers recipes resources templates}

  rm_rf sandbox_path
  mkdir_p sandbox_path
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox_path
end

private
def sandbox_path
  File.join(File.dirname(__FILE__), %w(tmp cookbooks cookbook))
end