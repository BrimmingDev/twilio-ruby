##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      ##
      # Initialize the Api Domain
      def initialize(twilio)
        super
        
        @base_url = 'https://api.twilio.com'
        @host = 'api.twilio.com'
        @port = 443
        
        # Versions
        @v2010 = nil
      end
      
      ##
      # Version v2010 of api
      def v2010
        @v2010 ||= V2010.new self
      end
      
      ##
      # Account provided as the authenticating account
      def account
        self.v2010.account
      end
      
      def accounts
        self.v2010.accounts
      end
      
      def addresses(sid=:unset)
        self.account.addresses(sid)
      end
      
      def applications(sid=:unset)
        self.account.applications(sid)
      end
      
      def authorized_connect_apps(connect_app_sid=:unset)
        self.account.authorized_connect_apps(connect_app_sid)
      end
      
      def available_phone_numbers(country_code=:unset)
        self.account.available_phone_numbers(country_code)
      end
      
      def calls(sid=:unset)
        self.account.calls(sid)
      end
      
      def conferences(sid=:unset)
        self.account.conferences(sid)
      end
      
      def connect_apps(sid=:unset)
        self.account.connect_apps(sid)
      end
      
      def incoming_phone_numbers(sid=:unset)
        self.account.incoming_phone_numbers(sid)
      end
      
      def messages(sid=:unset)
        self.account.messages(sid)
      end
      
      def notifications(sid=:unset)
        self.account.notifications(sid)
      end
      
      def outgoing_caller_ids(sid=:unset)
        self.account.outgoing_caller_ids(sid)
      end
      
      def queues(sid=:unset)
        self.account.queues(sid)
      end
      
      def recordings(sid=:unset)
        self.account.recordings(sid)
      end
      
      def sandbox
        self.account.sandbox()
      end
      
      def sip
        self.account.sip()
      end
      
      def sms
        self.account.sms()
      end
      
      def tokens
        self.account.tokens()
      end
      
      def transcriptions(sid=:unset)
        self.account.transcriptions(sid)
      end
      
      def usage
        self.account.usage()
      end
      
      def validation_requests
        self.account.validation_requests()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Api>'
      end
    end
  end
end