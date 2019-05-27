require_relative 'auth_api'
require_relative 'resources_api'
require_relative 'campaigns'

module InRepublic
  class Spot
    attr_reader :campaigns
    def initialize(options={})
      # options.transform_keys!(&:to_s)
      # jwt_token = InRepublic::AuthApi.instance.sign_in(options)['jwt_token']
      # InRepublic::ResourcesApi.instance.bearer=(jwt_token)
      all_campaigns
    end

    # def ids
    #   @campaigns.ids
    # end

    def all_campaigns
      campaigns_data = InRepublic::ResourcesApi.instance.campaigns
      @campaigns = InRepublic::Campaigns.new(campaigns_data)
    end

    def work_now?
      campaigns.work_now?
    end

    def media_item
      campaigns.media_item
    end

    def heart_beat
      InRepublic::ResourcesApi.instance.heart_beat
    end

    def update_campaigns
      all_campaigns
    end
  end
end
