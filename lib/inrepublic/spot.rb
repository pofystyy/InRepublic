require_relative 'auth_api'
require_relative 'resources_api'
require_relative 'schedule'

module InRepublic
  class Spot
    def initialize(options={})
      options.transform_keys!(&:to_s)
      jwt_token = InRepublic::AuthApi.instance.sign_in(options)['jwt_token']
      InRepublic::ResourcesApi.instance.bearer=(jwt_token)

      schedule_data = InRepublic::ResourcesApi.instance.schedule
      @schedule = InRepublic::Schedule.new(schedule_data)
    end

    def work_now?
      @schedule.work_now?
    end

    def media_item
      @schedule.media_item
    end
  end
end
