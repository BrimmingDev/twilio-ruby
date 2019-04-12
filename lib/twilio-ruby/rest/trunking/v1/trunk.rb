##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkList < ListResource
          ##
          # Initialize the TrunkList
          # @param [Version] version Version that contains the resource
          # @return [TrunkList] TrunkList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Trunks"
          end

          ##
          # Retrieve a single page of TrunkInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name A human-readable name for the Trunk.
          # @param [String] domain_name The unique address you reserve on Twilio to which
          #   you route your SIP traffic. Domain names can contain letters, digits, and `-`
          #   and must always end with `pstn.twilio.com`. See [Termination
          #   Settings](https://www.twilio.com/docs/sip-trunking/getting-started#termination)
          #   for more information.
          # @param [String] disaster_recovery_url The HTTP URL that Twilio will request if
          #   an error occurs while sending SIP traffic towards your configured Origination
          #   URL. Twilio will retrieve TwiML from this URL and execute those instructions
          #   like any other normal TwiML call. See [Disaster
          #   Recovery](https://www.twilio.com/docs/sip-trunking/getting-started#disaster-recovery) for more information.
          # @param [String] disaster_recovery_method The HTTP method Twilio will use when
          #   requesting the `DisasterRecoveryUrl`. Either `GET` or `POST`.
          # @param [trunk.RecordingSetting] recording The recording settings for this trunk.
          #   If turned on, all calls going through this trunk will be recorded and the
          #   recording can either start when the call is ringing or when the call is
          #   answered. See
          #   [Recording](https://www.twilio.com/docs/sip-trunking/getting-started#recording)
          #   for more information.
          # @param [Boolean] secure The Secure Trunking  settings for this trunk. If turned
          #   on, all calls going through this trunk will be secure using SRTP for media and
          #   TLS for signalling. If turned off, then RTP will be used for media. See [Secure
          #   Trunking](https://www.twilio.com/docs/sip-trunking/getting-started#securetrunking) for more information.
          # @param [Boolean] cnam_lookup_enabled The Caller ID Name (CNAM) lookup setting
          #   for this trunk. If turned on, all inbound calls to this SIP Trunk from the
          #   United States and Canada will automatically perform a CNAM Lookup and display
          #   Caller ID data on your phone. See
          #   [CNAM](https://www.twilio.com/docs/sip-trunking#CNAM) Lookups for more
          #   information.
          # @return [TrunkInstance] Newly created TrunkInstance
          def create(friendly_name: :unset, domain_name: :unset, disaster_recovery_url: :unset, disaster_recovery_method: :unset, recording: :unset, secure: :unset, cnam_lookup_enabled: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'DomainName' => domain_name,
                'DisasterRecoveryUrl' => disaster_recovery_url,
                'DisasterRecoveryMethod' => disaster_recovery_method,
                'Recording' => recording,
                'Secure' => secure,
                'CnamLookupEnabled' => cnam_lookup_enabled,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            TrunkInstance.new(@version, payload, )
          end

          ##
          # Lists TrunkInstance records from the API as a list.
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
          # Streams TrunkInstance records from the API as an Enumerable.
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
          # When passed a block, yields TrunkInstance records from the API.
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
          # Retrieve a single page of TrunkInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of TrunkInstance
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
            TrunkPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of TrunkInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of TrunkInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            TrunkPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Trunking.V1.TrunkList>'
          end
        end

        class TrunkPage < Page
          ##
          # Initialize the TrunkPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [TrunkPage] TrunkPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of TrunkInstance
          # @param [Hash] payload Payload response from the API
          # @return [TrunkInstance] TrunkInstance
          def get_instance(payload)
            TrunkInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Trunking.V1.TrunkPage>'
          end
        end

        class TrunkContext < InstanceContext
          ##
          # Initialize the TrunkContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A 34 character string that uniquely identifies the SIP Trunk
          #   in Twilio.
          # @return [TrunkContext] TrunkContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Trunks/#{@solution[:sid]}"

            # Dependents
            @origination_urls = nil
            @credentials_lists = nil
            @ip_access_control_lists = nil
            @phone_numbers = nil
            @terminating_sip_domains = nil
          end

          ##
          # Fetch a TrunkInstance
          # @return [TrunkInstance] Fetched TrunkInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            TrunkInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the TrunkInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the TrunkInstance
          # @param [String] friendly_name A human-readable name for the Trunk.
          # @param [String] domain_name The unique address you reserve on Twilio to which
          #   you route your SIP traffic. Domain names can contain letters, digits, and `-`
          #   and must always end with `pstn.twilio.com`. See [Termination
          #   Settings](https://www.twilio.com/docs/sip-trunking/getting-started#termination)
          #   for more information.
          # @param [String] disaster_recovery_url The HTTP URL that Twilio will request if
          #   an error occurs while sending SIP traffic towards your configured Origination
          #   URL. Twilio will retrieve TwiML from this URL and execute those instructions
          #   like any other normal TwiML call. See [Disaster
          #   Recovery](https://www.twilio.com/docs/sip-trunking/getting-started#disaster-recovery) for more information.
          # @param [String] disaster_recovery_method The HTTP method Twilio will use when
          #   requesting the `DisasterRecoveryUrl`. Either `GET` or `POST`.
          # @param [trunk.RecordingSetting] recording The recording settings for this trunk.
          #   If turned on, all calls going through this trunk will be recorded and the
          #   recording can either start when the call is ringing or when the call is
          #   answered. See
          #   [Recording](https://www.twilio.com/docs/sip-trunking/getting-started#recording)
          #   for more information.
          # @param [Boolean] secure The Secure Trunking  settings for this trunk. If turned
          #   on, all calls going through this trunk will be secure using SRTP for media and
          #   TLS for signalling. If turned off, then RTP will be used for media. See [Secure
          #   Trunking](https://www.twilio.com/docs/sip-trunking/getting-started#securetrunking) for more information.
          # @param [Boolean] cnam_lookup_enabled The Caller ID Name (CNAM) lookup setting
          #   for this trunk. If turned on, all inbound calls to this SIP Trunk from the
          #   United States and Canada will automatically perform a CNAM Lookup and display
          #   Caller ID data on your phone. See
          #   [CNAM](https://www.twilio.com/docs/sip-trunking#CNAM) Lookups for more
          #   information.
          # @return [TrunkInstance] Updated TrunkInstance
          def update(friendly_name: :unset, domain_name: :unset, disaster_recovery_url: :unset, disaster_recovery_method: :unset, recording: :unset, secure: :unset, cnam_lookup_enabled: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'DomainName' => domain_name,
                'DisasterRecoveryUrl' => disaster_recovery_url,
                'DisasterRecoveryMethod' => disaster_recovery_method,
                'Recording' => recording,
                'Secure' => secure,
                'CnamLookupEnabled' => cnam_lookup_enabled,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            TrunkInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the origination_urls
          # @return [OriginationUrlList]
          # @return [OriginationUrlContext] if sid was passed.
          def origination_urls(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return OriginationUrlContext.new(@version, @solution[:sid], sid, )
            end

            unless @origination_urls
              @origination_urls = OriginationUrlList.new(@version, trunk_sid: @solution[:sid], )
            end

            @origination_urls
          end

          ##
          # Access the credentials_lists
          # @return [CredentialListList]
          # @return [CredentialListContext] if sid was passed.
          def credentials_lists(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return CredentialListContext.new(@version, @solution[:sid], sid, )
            end

            unless @credentials_lists
              @credentials_lists = CredentialListList.new(@version, trunk_sid: @solution[:sid], )
            end

            @credentials_lists
          end

          ##
          # Access the ip_access_control_lists
          # @return [IpAccessControlListList]
          # @return [IpAccessControlListContext] if sid was passed.
          def ip_access_control_lists(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return IpAccessControlListContext.new(@version, @solution[:sid], sid, )
            end

            unless @ip_access_control_lists
              @ip_access_control_lists = IpAccessControlListList.new(@version, trunk_sid: @solution[:sid], )
            end

            @ip_access_control_lists
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
              @phone_numbers = PhoneNumberList.new(@version, trunk_sid: @solution[:sid], )
            end

            @phone_numbers
          end

          ##
          # Access the terminating_sip_domains
          # @return [TerminatingSipDomainList]
          # @return [TerminatingSipDomainContext] if sid was passed.
          def terminating_sip_domains(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TerminatingSipDomainContext.new(@version, @solution[:sid], sid, )
            end

            unless @terminating_sip_domains
              @terminating_sip_domains = TerminatingSipDomainList.new(@version, trunk_sid: @solution[:sid], )
            end

            @terminating_sip_domains
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trunking.V1.TrunkContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trunking.V1.TrunkContext #{context}>"
          end
        end

        class TrunkInstance < InstanceResource
          ##
          # Initialize the TrunkInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A 34 character string that uniquely identifies the SIP Trunk
          #   in Twilio.
          # @return [TrunkInstance] TrunkInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'domain_name' => payload['domain_name'],
                'disaster_recovery_method' => payload['disaster_recovery_method'],
                'disaster_recovery_url' => payload['disaster_recovery_url'],
                'friendly_name' => payload['friendly_name'],
                'secure' => payload['secure'],
                'recording' => payload['recording'],
                'cnam_lookup_enabled' => payload['cnam_lookup_enabled'],
                'auth_type' => payload['auth_type'],
                'auth_type_set' => payload['auth_type_set'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'sid' => payload['sid'],
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
          # @return [TrunkContext] TrunkContext for this TrunkInstance
          def context
            unless @instance_context
              @instance_context = TrunkContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique ID of the Account that owns this Trunk.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The unique address you reserve on Twilio to which you route your SIP traffic.
          def domain_name
            @properties['domain_name']
          end

          ##
          # @return [String] The HTTP method Twilio will use when requesting the DisasterRecoveryUrl.
          def disaster_recovery_method
            @properties['disaster_recovery_method']
          end

          ##
          # @return [String] The HTTP URL that Twilio will request if an error occurs while sending SIP traffic towards your configured Origination URL.
          def disaster_recovery_url
            @properties['disaster_recovery_url']
          end

          ##
          # @return [String] A human-readable name for the Trunk.
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Boolean] The Secure Trunking  settings for this trunk.
          def secure
            @properties['secure']
          end

          ##
          # @return [Hash] The recording settings for this trunk.
          def recording
            @properties['recording']
          end

          ##
          # @return [Boolean] The Caller ID Name (CNAM) lookup setting for this trunk.
          def cnam_lookup_enabled
            @properties['cnam_lookup_enabled']
          end

          ##
          # @return [String] The types of authentication you have mapped to your domain.
          def auth_type
            @properties['auth_type']
          end

          ##
          # @return [String] The auth_type_set
          def auth_type_set
            @properties['auth_type_set']
          end

          ##
          # @return [Time] The date this Activity was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this Activity was updated.
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] A 34 character string that uniquely identifies the SIP Trunk in Twilio.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The URL for this resource, relative to https://trunking.
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a TrunkInstance
          # @return [TrunkInstance] Fetched TrunkInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the TrunkInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the TrunkInstance
          # @param [String] friendly_name A human-readable name for the Trunk.
          # @param [String] domain_name The unique address you reserve on Twilio to which
          #   you route your SIP traffic. Domain names can contain letters, digits, and `-`
          #   and must always end with `pstn.twilio.com`. See [Termination
          #   Settings](https://www.twilio.com/docs/sip-trunking/getting-started#termination)
          #   for more information.
          # @param [String] disaster_recovery_url The HTTP URL that Twilio will request if
          #   an error occurs while sending SIP traffic towards your configured Origination
          #   URL. Twilio will retrieve TwiML from this URL and execute those instructions
          #   like any other normal TwiML call. See [Disaster
          #   Recovery](https://www.twilio.com/docs/sip-trunking/getting-started#disaster-recovery) for more information.
          # @param [String] disaster_recovery_method The HTTP method Twilio will use when
          #   requesting the `DisasterRecoveryUrl`. Either `GET` or `POST`.
          # @param [trunk.RecordingSetting] recording The recording settings for this trunk.
          #   If turned on, all calls going through this trunk will be recorded and the
          #   recording can either start when the call is ringing or when the call is
          #   answered. See
          #   [Recording](https://www.twilio.com/docs/sip-trunking/getting-started#recording)
          #   for more information.
          # @param [Boolean] secure The Secure Trunking  settings for this trunk. If turned
          #   on, all calls going through this trunk will be secure using SRTP for media and
          #   TLS for signalling. If turned off, then RTP will be used for media. See [Secure
          #   Trunking](https://www.twilio.com/docs/sip-trunking/getting-started#securetrunking) for more information.
          # @param [Boolean] cnam_lookup_enabled The Caller ID Name (CNAM) lookup setting
          #   for this trunk. If turned on, all inbound calls to this SIP Trunk from the
          #   United States and Canada will automatically perform a CNAM Lookup and display
          #   Caller ID data on your phone. See
          #   [CNAM](https://www.twilio.com/docs/sip-trunking#CNAM) Lookups for more
          #   information.
          # @return [TrunkInstance] Updated TrunkInstance
          def update(friendly_name: :unset, domain_name: :unset, disaster_recovery_url: :unset, disaster_recovery_method: :unset, recording: :unset, secure: :unset, cnam_lookup_enabled: :unset)
            context.update(
                friendly_name: friendly_name,
                domain_name: domain_name,
                disaster_recovery_url: disaster_recovery_url,
                disaster_recovery_method: disaster_recovery_method,
                recording: recording,
                secure: secure,
                cnam_lookup_enabled: cnam_lookup_enabled,
            )
          end

          ##
          # Access the origination_urls
          # @return [origination_urls] origination_urls
          def origination_urls
            context.origination_urls
          end

          ##
          # Access the credentials_lists
          # @return [credentials_lists] credentials_lists
          def credentials_lists
            context.credentials_lists
          end

          ##
          # Access the ip_access_control_lists
          # @return [ip_access_control_lists] ip_access_control_lists
          def ip_access_control_lists
            context.ip_access_control_lists
          end

          ##
          # Access the phone_numbers
          # @return [phone_numbers] phone_numbers
          def phone_numbers
            context.phone_numbers
          end

          ##
          # Access the terminating_sip_domains
          # @return [terminating_sip_domains] terminating_sip_domains
          def terminating_sip_domains
            context.terminating_sip_domains
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trunking.V1.TrunkInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trunking.V1.TrunkInstance #{values}>"
          end
        end
      end
    end
  end
end