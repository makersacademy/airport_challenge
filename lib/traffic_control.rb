require_relative "weather"

class TrafficControl

  def allow_landing_and_take_off_depending_on(weather)
    weather.state
    if weather.state == "sunny"
      @permission = true
      "Permission granted."
    else
      @permission = false
      "Permission is not granted due to stormy weather."
    end
  end

  def permission?
    @permission
  end

end
