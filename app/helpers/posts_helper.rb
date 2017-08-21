module PostsHelper
  def datetime_options
    options = []
    time = Time.now()
    end_time = time.beginning_of_day + 6.hour
    if (time < end_time)
      time = Time.new(time.year, time.month, time.day, time.hour, 0, 0) + 1.hour
    else
      hour = time.hour < 19 ? 19 : (time + 1.hour).hour
      time = Time.new(time.year, time.month, time.day, hour, 0, 0)
      end_time = end_time.tomorrow
    end
    while (time < end_time) do
      text = time.hour.to_s + ":00"
      value = time
      option = [text, value]
      options.push(option)
      time = time + 1.hour
    end
    options
  end
end
