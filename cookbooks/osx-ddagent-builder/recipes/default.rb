#
# Cookbook Name:: dd-agent-osx-build-box
# Recipe:: default
#
# Copyright 2015, Datadog Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "omnibus"

build_user = 'datadogloaner'

# And finally let's clonedd-agent-omnibus and install the binstubs for it
git 'dd-agent-omnibus' do
  destination "/Users/#{build_user}/dd-agent-omnibus"
  repository 'https://github.com/DataDog/dd-agent-omnibus.git'
  revision 'etienne/omnibus-4-mac'
  user build_user
  group 'admin'
  action :sync
end

# Let's install the binstubs for Omnibus
execute 'install_binstubs' do
  cwd "/Users/#{build_user}/dd-agent-omnibus"
  user build_user
  command "bundle install --binstubs"
end
