class Airport

  attr_reader :grounded_planes

  @@messages = {
    :landed => "Plane landed.",
#    :wrong_request => "That's a wierd request. I'll abstain.",
#    :stormy_weather => "Look at the sky, dude.",
#    :full_capacity => "We're full. Deal with it.",
  }

  def initialize
    @grounded_planes = []
  end

  def request(request_type, plane)
    return land(plane) if request_type == "landing"
#    return take_off(plane) if request_type == "take off"
#    engage(:wrong_request)
  end

private

  def land(plane)
    @grounded_planes << plane
    engage(:landed)
    return true
  end

#  def take_off(plane)
#  end

  def engage(message)
    puts @@messages[message]
  end
    
end
