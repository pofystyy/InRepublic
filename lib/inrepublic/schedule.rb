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

    private

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
  end
end
