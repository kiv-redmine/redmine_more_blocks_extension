# encoding: utf-8
#
# This file is a part of Redmine More Blocks Extension plugin
#
# @author Strnadj <jan.strnadek@gmail.com>

require File.expand_path('../../test_helper', __FILE__)

class BlocksTest < ActiveSupport::TestCase
  def test_exists_extras_blocks
    blocks = MyController::BLOCKS.keys
    assert blocks.include? 'projects'
  end
end
