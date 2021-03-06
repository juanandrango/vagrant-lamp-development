#
# Cookbook Name:: lamp
# Recipe:: xdebug
#
# Copyright 2011, Dave Widmer
#
# Licensed under the MIT license
#

if platform?(%w{debian ubuntu})
  package "php5-xdebug"
elsif platform?(%w{centos redhat fedora amazon scientific})
  php_pear "xdebug" do
    action :install
  end
end

template "#{node[:php][:ext_conf_dir]}/xdebug.ini" do
	owner "root"
	group "root"
	mode 0644
	source "xdebug.ini.erb"
	variables(
		:path => node[:lamp][:xdebug][:path]
	)
end
