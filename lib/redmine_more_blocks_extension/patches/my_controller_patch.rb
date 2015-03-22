module RedmineMoreBlocksExtension
  module Patches
    module MyControllerPatch
      def self.included(base)
        base.class_eval do
          def top_issues
            # Get issue list by project
            @project = Project.visible.find_by_identifier(params[:project]) || Project.visible.first
            @issues  = @project.issues.visible.limit(10)
          end
        end
      end
    end
  end
end
