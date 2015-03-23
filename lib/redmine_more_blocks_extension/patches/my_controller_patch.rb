module RedmineMoreBlocksExtension
  module Patches
    module MyControllerPatch
      def self.included(base)
        base.class_eval do
          helper :activities

          helper_method :retrieve_top_issues
          def retrieve_top_issues(project, filter, order_by, limit)
            # Prepare issues
            issues = project.issues.visible

            # Sort by ..
            case filter
            when :priority
              issues = issues.joins(:priority).order("#{IssuePriority.table_name}.position #{order_by}")
            when :subject
              issues = issues.order("#{Issue.table_name}.subject #{order_by}")
            when :tracker
              issues = issues.joins(:tracker).order("#{Tracker.table_name}.position #{order_by}")
            end

            # Return specific number of issues
            issues.limit(limit)
          end

          def top_issues
            # Parse parameters
            project_identifier = params[:project]
            project = Project.visible.find_by_identifier(project_identifier) || Project.visible.first

            # White list filter name
            if %w(priority tracker subject).include?(params[:filter])
              @filter = params[:filter].to_sym
            else
              @filter = :priority
            end

            # White list asc desc
            if %w(asc desc).include?(params[:order_by])
              @order_by = params[:order_by].to_sym
            else
              @order_by = :desc
            end

            # Limit?
            @limit = params[:limit].to_i || 10

            # Get issue list by project
            @issues  = retrieve_top_issues(project, @filter, @order_by, @limit)

            # Save settings!
            session[:top_issue_project]  = project.identifier
            session[:top_issue_order_by] = @order_by
            session[:top_issue_filter]   = @filter
            session[:top_issue_limit]    = @limit
          end
        end
      end
    end
  end
end
