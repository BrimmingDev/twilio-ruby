##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Messaging < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SessionList < ListResource
          ##
          # Initialize the SessionList
          # @param [Version] version Version that contains the resource
          # @return [SessionList] SessionList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Sessions"
          end

          ##
          # Retrieve a single page of SessionInstance records from the API.
          # Request is executed immediately.
          # @param [String] messaging_service_sid The unique id of the [SMS
          #   Service](https://www.twilio.com/docs/sms/services/api) this session belongs to.
          # @param [String] friendly_name The human-readable name of this session. Optional.
          # @param [String] attributes An optional string metadata field you can use to
          #   store any data you wish. The string value must contain structurally valid JSON
          #   if specified.  **Note** that if the attributes are not set "{}" will be
          #   returned.
          # @param [Time] date_created The date that this resource was created.
          # @param [Time] date_updated The date that this resource was last updated.
          # @param [String] created_by Identity of the session's creator. If the Session was
          #   created through the API, the value will be `system`
          # @return [SessionInstance] Newly created SessionInstance
          def create(messaging_service_sid: nil, friendly_name: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, created_by: :unset)
            data = Twilio::Values.of({
                'MessagingServiceSid' => messaging_service_sid,
                'FriendlyName' => friendly_name,
                'Attributes' => attributes,
                'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                'CreatedBy' => created_by,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            SessionInstance.new(@version, payload, )
          end

          ##
          # Lists SessionInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams SessionInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields SessionInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of SessionInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of SessionInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            SessionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of SessionInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of SessionInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            SessionPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Messaging.V1.SessionList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SessionPage < Page
          ##
          # Initialize the SessionPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [SessionPage] SessionPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of SessionInstance
          # @param [Hash] payload Payload response from the API
          # @return [SessionInstance] SessionInstance
          def get_instance(payload)
            SessionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Messaging.V1.SessionPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SessionContext < InstanceContext
          ##
          # Initialize the SessionContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A 34 character string that uniquely identifies this
          #   resource.
          # @return [SessionContext] SessionContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Sessions/#{@solution[:sid]}"

            # Dependents
            @participants = nil
            @messages = nil
            @webhooks = nil
          end

          ##
          # Fetch a SessionInstance
          # @return [SessionInstance] Fetched SessionInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            SessionInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the SessionInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the SessionInstance
          # @param [String] friendly_name The human-readable name of this session. Optional.
          # @param [String] attributes An optional string metadata field you can use to
          #   store any data you wish. The string value must contain structurally valid JSON
          #   if specified.  **Note** that if the attributes are not set "{}" will be
          #   returned.
          # @param [Time] date_created The date that this resource was created.
          # @param [Time] date_updated The date that this resource was last updated.
          # @param [String] created_by Identity of the session's creator. If the Session was
          #   created through the API, the value will be `system`
          # @return [SessionInstance] Updated SessionInstance
          def update(friendly_name: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, created_by: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'Attributes' => attributes,
                'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                'CreatedBy' => created_by,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            SessionInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the participants
          # @return [ParticipantList]
          # @return [ParticipantContext] if sid was passed.
          def participants(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ParticipantContext.new(@version, @solution[:sid], sid, )
            end

            unless @participants
              @participants = ParticipantList.new(@version, session_sid: @solution[:sid], )
            end

            @participants
          end

          ##
          # Access the messages
          # @return [MessageList]
          # @return [MessageContext] if sid was passed.
          def messages(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return MessageContext.new(@version, @solution[:sid], sid, )
            end

            unless @messages
              @messages = MessageList.new(@version, session_sid: @solution[:sid], )
            end

            @messages
          end

          ##
          # Access the webhooks
          # @return [WebhookList]
          # @return [WebhookContext] if sid was passed.
          def webhooks(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WebhookContext.new(@version, @solution[:sid], sid, )
            end

            unless @webhooks
              @webhooks = WebhookList.new(@version, session_sid: @solution[:sid], )
            end

            @webhooks
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Messaging.V1.SessionContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Messaging.V1.SessionContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SessionInstance < InstanceResource
          ##
          # Initialize the SessionInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A 34 character string that uniquely identifies this
          #   resource.
          # @return [SessionInstance] SessionInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'service_sid' => payload['service_sid'],
                'messaging_service_sid' => payload['messaging_service_sid'],
                'friendly_name' => payload['friendly_name'],
                'attributes' => payload['attributes'],
                'created_by' => payload['created_by'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [SessionContext] SessionContext for this SessionInstance
          def context
            unless @instance_context
              @instance_context = SessionContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] A 34 character string that uniquely identifies this resource.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The unique id of the Account responsible for this session.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The unique id of the Chat Service this session belongs to.
          def service_sid
            @properties['service_sid']
          end

          ##
          # @return [String] The unique id of the SMS Service this session belongs to.
          def messaging_service_sid
            @properties['messaging_service_sid']
          end

          ##
          # @return [String] The human-readable name of this session.
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] An optional string metadata field you can use to store any data you wish.
          def attributes
            @properties['attributes']
          end

          ##
          # @return [String] Identity of the session's creator.
          def created_by
            @properties['created_by']
          end

          ##
          # @return [Time] The date that this resource was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date that this resource was last updated.
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] An absolute URL for this session.
          def url
            @properties['url']
          end

          ##
          # @return [String] Absolute URLs to access the Participants and Messages for this Session.
          def links
            @properties['links']
          end

          ##
          # Fetch a SessionInstance
          # @return [SessionInstance] Fetched SessionInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the SessionInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the SessionInstance
          # @param [String] friendly_name The human-readable name of this session. Optional.
          # @param [String] attributes An optional string metadata field you can use to
          #   store any data you wish. The string value must contain structurally valid JSON
          #   if specified.  **Note** that if the attributes are not set "{}" will be
          #   returned.
          # @param [Time] date_created The date that this resource was created.
          # @param [Time] date_updated The date that this resource was last updated.
          # @param [String] created_by Identity of the session's creator. If the Session was
          #   created through the API, the value will be `system`
          # @return [SessionInstance] Updated SessionInstance
          def update(friendly_name: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, created_by: :unset)
            context.update(
                friendly_name: friendly_name,
                attributes: attributes,
                date_created: date_created,
                date_updated: date_updated,
                created_by: created_by,
            )
          end

          ##
          # Access the participants
          # @return [participants] participants
          def participants
            context.participants
          end

          ##
          # Access the messages
          # @return [messages] messages
          def messages
            context.messages
          end

          ##
          # Access the webhooks
          # @return [webhooks] webhooks
          def webhooks
            context.webhooks
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Messaging.V1.SessionInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Messaging.V1.SessionInstance #{values}>"
          end
        end
      end
    end
  end
end