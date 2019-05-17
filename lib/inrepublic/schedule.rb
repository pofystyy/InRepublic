require_relative 'media_item'
require 'time'

module InRepublic
  class Schedule
    def initialize(schedule_data)
      @schedule = schedule_data
    end

    def work_now?
      allowed_range = [
        today_work_schedule_open..today_work_schedule_close
      ]

      formatted_time = Time.now.strftime("%H:%M")

      allowed_range.any? { |range| range.cover?(formatted_time) }
    end

    def media_item
      InRepublic::MediaItem.new(random_media_item['id']).create_media
    end

    private
# ----- start: for method start
    def campaigns
      @schedule['campaigns']
    end

    def random_media_item
      campaigns.sample
    end
# ----- end: for method start


# ----- start: for method work_now?
    def location
      @schedule['location']
    end

    def today_work_schedule
      location['today_work_schedule']
    end

    def today_work_schedule_open
      today_work_schedule['open']
    end

    def today_work_schedule_close
      today_work_schedule['close']
    end
# ----- end: for method work_now?
  end
end
