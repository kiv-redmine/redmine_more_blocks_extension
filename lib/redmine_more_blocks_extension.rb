require 'redmine_more_blocks_extension/patches/my_controller_patch'
require 'redmine_more_blocks_extension/patches/my_helper_patch'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'my_controller'
  require_dependency 'my_helper'

  unless MyController.included_modules.include?(RedmineMoreBlocksExtension::Patches::MyControllerPatch)
    MyController.send(:include, RedmineMoreBlocksExtension::Patches::MyControllerPatch)
  end

  unless MyHelper.included_modules.include?(RedmineMoreBlocksExtension::Patches::MyHelperPatch)
    MyHelper.send(:include, RedmineMoreBlocksExtension::Patches::MyHelperPatch)
  end
end
