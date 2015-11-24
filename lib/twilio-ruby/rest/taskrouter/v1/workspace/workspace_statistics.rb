##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class WorkspaceStatisticsList < ListResource
      ##
      # Initialize the WorkspaceStatisticsList
      def initialize(version, workspace_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            workspace_sid: workspace_sid
        }
      end
      
      ##
      # Constructs a WorkspaceStatisticsContext
      def get
        WorkspaceStatisticsContext.new(
            @version,
            workspace_sid: @solution[:workspace_sid],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Taskrouter.V1.WorkspaceStatisticsList>'
      end
    end
  
    class WorkspaceStatisticsPage < Page
      def initialize(version, response, workspace_sid: nil)
        super(version, response)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid,
        }
      end
      
      def get_instance(payload)
        return WorkspaceStatisticsInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Taskrouter.V1.WorkspaceStatisticsPage>'
      end
    end
  
    class WorkspaceStatisticsContext < InstanceContext
      def initialize(version, workspace_sid)
        super(version)
        
        # Path Solution
        @solution = {
            workspace_sid: workspace_sid,
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Statistics"
      end
      
      ##
      # Fetch a WorkspaceStatisticsInstance
      def fetch(minutes: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil)
        params = {
            'Minutes' => minutes,
            'StartDate<' => Twilio.serialize_iso8601(start_date_before),
            'StartDate' => Twilio.serialize_iso8601(start_date),
            'StartDate>' => Twilio.serialize_iso8601(start_date_after),
            'EndDate<' => Twilio.serialize_iso8601(end_date_before),
            'EndDate' => Twilio.serialize_iso8601(end_date),
            'EndDate>' => Twilio.serialize_iso8601(end_date_after),
        }
        
        payload = @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return WorkspaceStatisticsInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Taskrouter.V1.WorkspaceStatisticsContext #{context}>"
      end
    end
  
    class WorkspaceStatisticsInstance < InstanceResource
      def initialize(version, payload, workspace_sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'realtime' => payload['realtime'],
            'cumulative' => payload['cumulative'],
            'account_sid' => payload['account_sid'],
            'workspace_sid' => payload['workspace_sid'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'workspace_sid' => workspace_sid,
        }
      end
      
      def context
        unless @instance_context
          @instance_context = WorkspaceStatisticsContext.new(
              @version,
              @params['workspace_sid'],
          )
        end
        @instance_context
      end
      
      def realtime
        @properties['realtime']
      end
      
      def cumulative
        @properties['cumulative']
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def workspace_sid
        @properties['workspace_sid']
      end
      
      ##
      # Fetch a WorkspaceStatisticsInstance
      def fetch(minutes: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil)
        @context.fetch(
            start_date_before: nil,
            start_date: nil,
            start_date_after: nil,
            end_date_before: nil,
            end_date: nil,
            end_date_after: nil,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Taskrouter.V1.WorkspaceStatisticsInstance #{context}>"
      end
    end
  end
end