module RedmineMoreBlocksExtension
  module Patches
    module MyHelperPatch
      def self.included(base)
        base.class_eval do
          def link_to_top_issue_sort(name, label, filter, order_by)
            style = "sort_icon "

            if filter == name
              style << order_by.to_s
            end

            link_to_function label, "changeOrder('#{name}', $(this))", class: style
          end
        end
      end
    end
  end
end
