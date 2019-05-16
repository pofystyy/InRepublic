require_relative 'auth_api'
require_relative 'resources_api'
require_relative 'schedule'

module InRepublic
  class Spot
    def initialize(options={})
      auth_code = options.values.join
      jwt_token = InRepublic::AuthApi.instance.sign_in('auth_code' => auth_code)['jwt_token']
      InRepublic::ResourcesApi.instance.bearer=(jwt_token)

      schedule_data = InRepublic::ResourcesApi.instance.schedule
      @schedule = InRepublic::Schedule.new(schedule_data)
    end

    def work_now?
      @schedule.work_now?
    end
  end
end
