# encoding: utf-8
#
# This file is a part of Redmine More Blocks Extension plugin
#
# @author Strnadj <jan.strnadek@gmail.com>

require 'redmine'

Redmine::Plugin.register :redmine_more_blocks_extension do
  name 'Redmine More Blocks plugin'
  author 'Strnadj <jan.strnadek@gamil.com>'
  description 'Add more blocks to my page'
  version '0.0.1'
  url 'https://github.com/kiv-redmine/redmine_more_blocks_extension'

  # Prerequisites
  requires_redmine version_or_higher: '2.4'
end
