##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class EntityContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class NewFactorList < ListResource
              ##
              # Initialize the NewFactorList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity The unique external identifier for the Entity of the
              #   Service. This identifier should be immutable, not PII, and generated by your
              #   external system, such as your user's UUID, GUID, or SID. This value must be
              #   between 8 and 64 characters long.
              # @return [NewFactorList] NewFactorList
              def initialize(version, service_sid: nil, identity: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity}
                @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Factors"
              end

              ##
              # Create the NewFactorInstance
              # @param [String] friendly_name The friendly name of this Factor. It can be up to
              #   64 characters.
              # @param [new_factor.FactorTypes] factor_type The Type of this Factor. Currently
              #   `push` and `totp` are supported. For `totp` to work, you need to contact Twilio
              #   sales first to have the Verify TOTP feature enabled for your Twilio account.
              # @param [String] binding_alg The algorithm used when `factor_type` is `push`.
              #   Algorithm supported: `ES256`
              # @param [String] binding_public_key The Ecdsa public key in PKIX, ASN.1 DER
              #   format encoded in Base64
              # @param [String] config_app_id The ID that uniquely identifies your app in the
              #   Google or Apple store, such as `com.example.myapp`. Required when `factor_type`
              #   is `push`. If specified, it can be up to 100 characters long.
              # @param [new_factor.NotificationPlatforms] config_notification_platform The
              #   transport technology used to generate the Notification Token. Can be `apn` or
              #   `fcm`. Required when `factor_type` is `push`
              # @param [String] config_notification_token For APN, the device token. For FCM the
              #   registration token. It used to send the push notifications. Required when
              #   `factor_type` is `push`. If specified, this value must be between 32 and 255
              #   characters long.
              # @param [String] config_sdk_version The Verify Push SDK version used to configure
              #   the factor
              # @param [String] binding_secret The shared secret for TOTP factors encoded in
              #   Base32
              # @param [String] config_time_step Defines how often, in seconds, are TOTP codes
              #   generated. i.e, a new TOTP code is generated every time_step seconds. Must be
              #   between 20 and 60 seconds, inclusive. The default value is defined at the
              #   service level in the property totp.time_step. If not configured defaults to 30
              #   seconds
              # @param [String] config_skew The number of time-steps, past and future, that are
              #   valid for validation of TOTP codes. Must be between 0 and 2, inclusive. The
              #   default value is defined at the service level in the property totp.skew. If not
              #   configured defaults to 1
              # @param [String] config_code_length Number of digits for generated TOTP codes.
              #   Must be between 3 and 8, inclusive. The default value is defined at the service
              #   level in the property totp.code_length. If not configured defaults to 6
              # @param [new_factor.TotpAlgorithms] config_alg The algorithm used to derive the
              #   TOTP codes. Can be `sha1`, `sha256` or `sha512`. Defaults to `sha1`
              # @return [NewFactorInstance] Created NewFactorInstance
              def create(friendly_name: nil, factor_type: nil, binding_alg: :unset, binding_public_key: :unset, config_app_id: :unset, config_notification_platform: :unset, config_notification_token: :unset, config_sdk_version: :unset, binding_secret: :unset, config_time_step: :unset, config_skew: :unset, config_code_length: :unset, config_alg: :unset)
                data = Twilio::Values.of({
                    'FriendlyName' => friendly_name,
                    'FactorType' => factor_type,
                    'Binding.Alg' => binding_alg,
                    'Binding.PublicKey' => binding_public_key,
                    'Config.AppId' => config_app_id,
                    'Config.NotificationPlatform' => config_notification_platform,
                    'Config.NotificationToken' => config_notification_token,
                    'Config.SdkVersion' => config_sdk_version,
                    'Binding.Secret' => binding_secret,
                    'Config.TimeStep' => config_time_step,
                    'Config.Skew' => config_skew,
                    'Config.CodeLength' => config_code_length,
                    'Config.Alg' => config_alg,
                })

                payload = @version.create('POST', @uri, data: data)

                NewFactorInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Verify.V2.NewFactorList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class NewFactorPage < Page
              ##
              # Initialize the NewFactorPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [NewFactorPage] NewFactorPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of NewFactorInstance
              # @param [Hash] payload Payload response from the API
              # @return [NewFactorInstance] NewFactorInstance
              def get_instance(payload)
                NewFactorInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Verify.V2.NewFactorPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class NewFactorInstance < InstanceResource
              ##
              # Initialize the NewFactorInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity The unique external identifier for the Entity of the
              #   Service. This identifier should be immutable, not PII, and generated by your
              #   external system, such as your user's UUID, GUID, or SID. This value must be
              #   between 8 and 64 characters long.
              # @return [NewFactorInstance] NewFactorInstance
              def initialize(version, payload, service_sid: nil, identity: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'entity_sid' => payload['entity_sid'],
                    'identity' => payload['identity'],
                    'binding' => payload['binding'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'status' => payload['status'],
                    'factor_type' => payload['factor_type'],
                    'config' => payload['config'],
                    'url' => payload['url'],
                }
              end

              ##
              # @return [String] A string that uniquely identifies this Factor.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Service Sid.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] Entity Sid.
              def entity_sid
                @properties['entity_sid']
              end

              ##
              # @return [String] Unique external identifier of the Entity
              def identity
                @properties['identity']
              end

              ##
              # @return [Hash] Unique external identifier of the Entity
              def binding
                @properties['binding']
              end

              ##
              # @return [Time] The date this Factor was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this Factor was updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] A human readable description of this resource.
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [new_factor.FactorStatuses] The Status of this Factor
              def status
                @properties['status']
              end

              ##
              # @return [new_factor.FactorTypes] The Type of this Factor
              def factor_type
                @properties['factor_type']
              end

              ##
              # @return [Hash] Binding for a `factor_type`.
              def config
                @properties['config']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Verify.V2.NewFactorInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Verify.V2.NewFactorInstance>"
              end
            end
          end
        end
      end
    end
  end
end