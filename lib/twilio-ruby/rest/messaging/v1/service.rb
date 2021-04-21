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
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Create the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to 64 characters long.
          # @param [String] inbound_request_url The URL we call using `inbound_method` when
          #   a message is received by any phone number or short code in the Service. When
          #   this property is `null`, receiving inbound messages is disabled. All messages
          #   sent to the Twilio phone number or short code will not be logged and received on
          #   the Account. If the `use_inbound_webhook_on_number` field is enabled then the
          #   webhook url defined on the phone number will override the `inbound_request_url`
          #   defined for the Messaging Service.
          # @param [String] inbound_method The HTTP method we should use to call
          #   `inbound_request_url`. Can be `GET` or `POST` and the default is `POST`.
          # @param [String] fallback_url The URL that we call using `fallback_method` if an
          #   error occurs while retrieving or executing the TwiML from the Inbound Request
          #   URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook
          #   url defined on the phone number will override the `fallback_url` defined for the
          #   Messaging Service.
          # @param [String] fallback_method The HTTP method we should use to call
          #   `fallback_url`. Can be: `GET` or `POST`.
          # @param [String] status_callback The URL we should call to {pass status
          #   updates}[https://www.twilio.com/docs/sms/api/message-resource#message-status-values]
          #   about message delivery.
          # @param [Boolean] sticky_sender Whether to enable {Sticky
          #   Sender}[https://www.twilio.com/docs/sms/services#sticky-sender] on the Service
          #   instance.
          # @param [Boolean] mms_converter Whether to enable the {MMS
          #   Converter}[https://www.twilio.com/docs/sms/services#mms-converter] for messages
          #   sent through the Service instance.
          # @param [Boolean] smart_encoding Whether to enable {Smart
          #   Encoding}[https://www.twilio.com/docs/sms/services#smart-encoding] for messages
          #   sent through the Service instance.
          # @param [service.ScanMessageContent] scan_message_content Reserved.
          # @param [Boolean] fallback_to_long_code Whether to enable {Fallback to Long
          #   Code}[https://www.twilio.com/docs/sms/services#fallback-to-long-code] for
          #   messages sent through the Service instance.
          # @param [Boolean] area_code_geomatch Whether to enable {Area Code
          #   Geomatch}[https://www.twilio.com/docs/sms/services#area-code-geomatch] on the
          #   Service Instance.
          # @param [String] validity_period How long, in seconds, messages sent from the
          #   Service are valid. Can be an integer from `1` to `14,400`.
          # @param [Boolean] synchronous_validation Reserved.
          # @param [Boolean] use_inbound_webhook_on_number A boolean value that indicates
          #   either the webhook url configured on the phone number will be used or
          #   `inbound_request_url`/`fallback_url` url will be called when a message is
          #   received from the phone number. If this field is enabled then the webhook url
          #   defined on the phone number will override the
          #   `inbound_request_url`/`fallback_url` defined for the Messaging Service.
          # @return [ServiceInstance] Created ServiceInstance
          def create(friendly_name: nil, inbound_request_url: :unset, inbound_method: :unset, fallback_url: :unset, fallback_method: :unset, status_callback: :unset, sticky_sender: :unset, mms_converter: :unset, smart_encoding: :unset, scan_message_content: :unset, fallback_to_long_code: :unset, area_code_geomatch: :unset, validity_period: :unset, synchronous_validation: :unset, use_inbound_webhook_on_number: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'InboundRequestUrl' => inbound_request_url,
                'InboundMethod' => inbound_method,
                'FallbackUrl' => fallback_url,
                'FallbackMethod' => fallback_method,
                'StatusCallback' => status_callback,
                'StickySender' => sticky_sender,
                'MmsConverter' => mms_converter,
                'SmartEncoding' => smart_encoding,
                'ScanMessageContent' => scan_message_content,
                'FallbackToLongCode' => fallback_to_long_code,
                'AreaCodeGeomatch' => area_code_geomatch,
                'ValidityPeriod' => validity_period,
                'SynchronousValidation' => synchronous_validation,
                'UseInboundWebhookOnNumber' => use_inbound_webhook_on_number,
            })

            payload = @version.create('POST', @uri, data: data)

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
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
          # Streams ServiceInstance records from the API as an Enumerable.
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
          # When passed a block, yields ServiceInstance records from the API.
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
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Messaging.V1.ServiceList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Messaging.V1.ServicePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the Service resource to fetch.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @phone_numbers = nil
            @short_codes = nil
            @alpha_senders = nil
            @us_app_to_person = nil
            @us_app_to_person_usecases = nil
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to 64 characters long.
          # @param [String] inbound_request_url The URL we call using `inbound_method` when
          #   a message is received by any phone number or short code in the Service. When
          #   this property is `null`, receiving inbound messages is disabled. All messages
          #   sent to the Twilio phone number or short code will not be logged and received on
          #   the Account. If the `use_inbound_webhook_on_number` field is enabled then the
          #   webhook url defined on the phone number will override the `inbound_request_url`
          #   defined for the Messaging Service.
          # @param [String] inbound_method The HTTP method we should use to call
          #   `inbound_request_url`. Can be `GET` or `POST` and the default is `POST`.
          # @param [String] fallback_url The URL that we call using `fallback_method` if an
          #   error occurs while retrieving or executing the TwiML from the Inbound Request
          #   URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook
          #   url defined on the phone number will override the `fallback_url` defined for the
          #   Messaging Service.
          # @param [String] fallback_method The HTTP method we should use to call
          #   `fallback_url`. Can be: `GET` or `POST`.
          # @param [String] status_callback The URL we should call to {pass status
          #   updates}[https://www.twilio.com/docs/sms/api/message-resource#message-status-values]
          #   about message delivery.
          # @param [Boolean] sticky_sender Whether to enable {Sticky
          #   Sender}[https://www.twilio.com/docs/sms/services#sticky-sender] on the Service
          #   instance.
          # @param [Boolean] mms_converter Whether to enable the {MMS
          #   Converter}[https://www.twilio.com/docs/sms/services#mms-converter] for messages
          #   sent through the Service instance.
          # @param [Boolean] smart_encoding Whether to enable {Smart
          #   Encoding}[https://www.twilio.com/docs/sms/services#smart-encoding] for messages
          #   sent through the Service instance.
          # @param [service.ScanMessageContent] scan_message_content Reserved.
          # @param [Boolean] fallback_to_long_code Whether to enable {Fallback to Long
          #   Code}[https://www.twilio.com/docs/sms/services#fallback-to-long-code] for
          #   messages sent through the Service instance.
          # @param [Boolean] area_code_geomatch Whether to enable {Area Code
          #   Geomatch}[https://www.twilio.com/docs/sms/services#area-code-geomatch] on the
          #   Service Instance.
          # @param [String] validity_period How long, in seconds, messages sent from the
          #   Service are valid. Can be an integer from `1` to `14,400`.
          # @param [Boolean] synchronous_validation Reserved.
          # @param [Boolean] use_inbound_webhook_on_number A boolean value that indicates
          #   either the webhook url configured on the phone number will be used or
          #   `inbound_request_url`/`fallback_url` url will be called when a message is
          #   received from the phone number. If this field is enabled then the webhook url
          #   defined on the phone number will override the
          #   `inbound_request_url`/`fallback_url` defined for the Messaging Service.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, inbound_request_url: :unset, inbound_method: :unset, fallback_url: :unset, fallback_method: :unset, status_callback: :unset, sticky_sender: :unset, mms_converter: :unset, smart_encoding: :unset, scan_message_content: :unset, fallback_to_long_code: :unset, area_code_geomatch: :unset, validity_period: :unset, synchronous_validation: :unset, use_inbound_webhook_on_number: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'InboundRequestUrl' => inbound_request_url,
                'InboundMethod' => inbound_method,
                'FallbackUrl' => fallback_url,
                'FallbackMethod' => fallback_method,
                'StatusCallback' => status_callback,
                'StickySender' => sticky_sender,
                'MmsConverter' => mms_converter,
                'SmartEncoding' => smart_encoding,
                'ScanMessageContent' => scan_message_content,
                'FallbackToLongCode' => fallback_to_long_code,
                'AreaCodeGeomatch' => area_code_geomatch,
                'ValidityPeriod' => validity_period,
                'SynchronousValidation' => synchronous_validation,
                'UseInboundWebhookOnNumber' => use_inbound_webhook_on_number,
            })

            payload = @version.update('POST', @uri, data: data)

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Fetch the ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the ServiceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Access the phone_numbers
          # @return [PhoneNumberList]
          # @return [PhoneNumberContext] if sid was passed.
          def phone_numbers(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return PhoneNumberContext.new(@version, @solution[:sid], sid, )
            end

            unless @phone_numbers
              @phone_numbers = PhoneNumberList.new(@version, service_sid: @solution[:sid], )
            end

            @phone_numbers
          end

          ##
          # Access the short_codes
          # @return [ShortCodeList]
          # @return [ShortCodeContext] if sid was passed.
          def short_codes(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ShortCodeContext.new(@version, @solution[:sid], sid, )
            end

            unless @short_codes
              @short_codes = ShortCodeList.new(@version, service_sid: @solution[:sid], )
            end

            @short_codes
          end

          ##
          # Access the alpha_senders
          # @return [AlphaSenderList]
          # @return [AlphaSenderContext] if sid was passed.
          def alpha_senders(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return AlphaSenderContext.new(@version, @solution[:sid], sid, )
            end

            unless @alpha_senders
              @alpha_senders = AlphaSenderList.new(@version, service_sid: @solution[:sid], )
            end

            @alpha_senders
          end

          ##
          # Access the us_app_to_person
          # @return [UsAppToPersonList]
          # @return [UsAppToPersonContext]
          def us_app_to_person
            unless @us_app_to_person
              @us_app_to_person = UsAppToPersonList.new(@version, messaging_service_sid: @solution[:sid], )
            end

            @us_app_to_person
          end

          ##
          # Access the us_app_to_person_usecases
          # @return [UsAppToPersonUsecaseList]
          # @return [UsAppToPersonUsecaseContext]
          def us_app_to_person_usecases
            unless @us_app_to_person_usecases
              @us_app_to_person_usecases = UsAppToPersonUsecaseList.new(
                  @version,
                  messaging_service_sid: @solution[:sid],
              )
            end

            @us_app_to_person_usecases
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Messaging.V1.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Messaging.V1.ServiceContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the Service resource to fetch.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'inbound_request_url' => payload['inbound_request_url'],
                'inbound_method' => payload['inbound_method'],
                'fallback_url' => payload['fallback_url'],
                'fallback_method' => payload['fallback_method'],
                'status_callback' => payload['status_callback'],
                'sticky_sender' => payload['sticky_sender'],
                'mms_converter' => payload['mms_converter'],
                'smart_encoding' => payload['smart_encoding'],
                'scan_message_content' => payload['scan_message_content'],
                'fallback_to_long_code' => payload['fallback_to_long_code'],
                'area_code_geomatch' => payload['area_code_geomatch'],
                'synchronous_validation' => payload['synchronous_validation'],
                'validity_period' => payload['validity_period'].to_i,
                'url' => payload['url'],
                'links' => payload['links'],
                'use_inbound_webhook_on_number' => payload['use_inbound_webhook_on_number'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The URL we call using inbound_method when a message is received by any phone number or short code in the Service. This field will be overridden if the `use_inbound_webhook_on_number` field is enabled.
          def inbound_request_url
            @properties['inbound_request_url']
          end

          ##
          # @return [String] The HTTP method we use to call inbound_request_url
          def inbound_method
            @properties['inbound_method']
          end

          ##
          # @return [String] The URL that we call using fallback_method if an error occurs while retrieving or executing the TwiML from the Inbound Request URL. This field will be overridden if the `use_inbound_webhook_on_number` field is enabled.
          def fallback_url
            @properties['fallback_url']
          end

          ##
          # @return [String] The HTTP method we use to call fallback_url
          def fallback_method
            @properties['fallback_method']
          end

          ##
          # @return [String] The URL we call to pass status updates about message delivery
          def status_callback
            @properties['status_callback']
          end

          ##
          # @return [Boolean] Whether to enable Sticky Sender on the Service instance
          def sticky_sender
            @properties['sticky_sender']
          end

          ##
          # @return [Boolean] Whether to enable the MMS Converter for messages sent through the Service instance
          def mms_converter
            @properties['mms_converter']
          end

          ##
          # @return [Boolean] Whether to enable Encoding for messages sent through the Service instance
          def smart_encoding
            @properties['smart_encoding']
          end

          ##
          # @return [service.ScanMessageContent] Reserved
          def scan_message_content
            @properties['scan_message_content']
          end

          ##
          # @return [Boolean] Whether to enable Fallback to Long Code for messages sent through the Service instance
          def fallback_to_long_code
            @properties['fallback_to_long_code']
          end

          ##
          # @return [Boolean] Whether to enable Area Code Geomatch on the Service Instance
          def area_code_geomatch
            @properties['area_code_geomatch']
          end

          ##
          # @return [Boolean] Reserved
          def synchronous_validation
            @properties['synchronous_validation']
          end

          ##
          # @return [String] How long, in seconds, messages sent from the Service are valid
          def validity_period
            @properties['validity_period']
          end

          ##
          # @return [String] The absolute URL of the Service resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The absolute URLs of related resources
          def links
            @properties['links']
          end

          ##
          # @return [Boolean] If enabled, the webhook url configured on the phone number will be used and will override the `inbound_request_url`/`fallback_url` url called when an inbound message is received.
          def use_inbound_webhook_on_number
            @properties['use_inbound_webhook_on_number']
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to 64 characters long.
          # @param [String] inbound_request_url The URL we call using `inbound_method` when
          #   a message is received by any phone number or short code in the Service. When
          #   this property is `null`, receiving inbound messages is disabled. All messages
          #   sent to the Twilio phone number or short code will not be logged and received on
          #   the Account. If the `use_inbound_webhook_on_number` field is enabled then the
          #   webhook url defined on the phone number will override the `inbound_request_url`
          #   defined for the Messaging Service.
          # @param [String] inbound_method The HTTP method we should use to call
          #   `inbound_request_url`. Can be `GET` or `POST` and the default is `POST`.
          # @param [String] fallback_url The URL that we call using `fallback_method` if an
          #   error occurs while retrieving or executing the TwiML from the Inbound Request
          #   URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook
          #   url defined on the phone number will override the `fallback_url` defined for the
          #   Messaging Service.
          # @param [String] fallback_method The HTTP method we should use to call
          #   `fallback_url`. Can be: `GET` or `POST`.
          # @param [String] status_callback The URL we should call to {pass status
          #   updates}[https://www.twilio.com/docs/sms/api/message-resource#message-status-values]
          #   about message delivery.
          # @param [Boolean] sticky_sender Whether to enable {Sticky
          #   Sender}[https://www.twilio.com/docs/sms/services#sticky-sender] on the Service
          #   instance.
          # @param [Boolean] mms_converter Whether to enable the {MMS
          #   Converter}[https://www.twilio.com/docs/sms/services#mms-converter] for messages
          #   sent through the Service instance.
          # @param [Boolean] smart_encoding Whether to enable {Smart
          #   Encoding}[https://www.twilio.com/docs/sms/services#smart-encoding] for messages
          #   sent through the Service instance.
          # @param [service.ScanMessageContent] scan_message_content Reserved.
          # @param [Boolean] fallback_to_long_code Whether to enable {Fallback to Long
          #   Code}[https://www.twilio.com/docs/sms/services#fallback-to-long-code] for
          #   messages sent through the Service instance.
          # @param [Boolean] area_code_geomatch Whether to enable {Area Code
          #   Geomatch}[https://www.twilio.com/docs/sms/services#area-code-geomatch] on the
          #   Service Instance.
          # @param [String] validity_period How long, in seconds, messages sent from the
          #   Service are valid. Can be an integer from `1` to `14,400`.
          # @param [Boolean] synchronous_validation Reserved.
          # @param [Boolean] use_inbound_webhook_on_number A boolean value that indicates
          #   either the webhook url configured on the phone number will be used or
          #   `inbound_request_url`/`fallback_url` url will be called when a message is
          #   received from the phone number. If this field is enabled then the webhook url
          #   defined on the phone number will override the
          #   `inbound_request_url`/`fallback_url` defined for the Messaging Service.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, inbound_request_url: :unset, inbound_method: :unset, fallback_url: :unset, fallback_method: :unset, status_callback: :unset, sticky_sender: :unset, mms_converter: :unset, smart_encoding: :unset, scan_message_content: :unset, fallback_to_long_code: :unset, area_code_geomatch: :unset, validity_period: :unset, synchronous_validation: :unset, use_inbound_webhook_on_number: :unset)
            context.update(
                friendly_name: friendly_name,
                inbound_request_url: inbound_request_url,
                inbound_method: inbound_method,
                fallback_url: fallback_url,
                fallback_method: fallback_method,
                status_callback: status_callback,
                sticky_sender: sticky_sender,
                mms_converter: mms_converter,
                smart_encoding: smart_encoding,
                scan_message_content: scan_message_content,
                fallback_to_long_code: fallback_to_long_code,
                area_code_geomatch: area_code_geomatch,
                validity_period: validity_period,
                synchronous_validation: synchronous_validation,
                use_inbound_webhook_on_number: use_inbound_webhook_on_number,
            )
          end

          ##
          # Fetch the ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Delete the ServiceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Access the phone_numbers
          # @return [phone_numbers] phone_numbers
          def phone_numbers
            context.phone_numbers
          end

          ##
          # Access the short_codes
          # @return [short_codes] short_codes
          def short_codes
            context.short_codes
          end

          ##
          # Access the alpha_senders
          # @return [alpha_senders] alpha_senders
          def alpha_senders
            context.alpha_senders
          end

          ##
          # Access the us_app_to_person
          # @return [us_app_to_person] us_app_to_person
          def us_app_to_person
            context.us_app_to_person
          end

          ##
          # Access the us_app_to_person_usecases
          # @return [us_app_to_person_usecases] us_app_to_person_usecases
          def us_app_to_person_usecases
            context.us_app_to_person_usecases
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Messaging.V1.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Messaging.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end