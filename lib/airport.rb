require_relative "plane"

class Airport

  def weather_stormy?
    #The weather generator: it will return true 10% of the time
    rand(101) <= 10
  end

  def deny_plane
    'Airport closed due to stormy weather' if weather_stormy?
  end

  def accept_plane (plane)
    fail 'Airport full' if airport_full
  end

  private

  def airport_full
    true
  end
end
