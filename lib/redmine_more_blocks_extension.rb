require 'redmine_more_blocks_extension/patches/my_controller_patch'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'my_controller'

  unless MyController.included_modules.include?(RedmineMoreBlocksExtension::Patches::MyControllerPatch)
    MyController.send(:include, RedmineMoreBlocksExtension::Patches::MyControllerPatch)
  end
end
