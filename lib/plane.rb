require_relative 'weather'

class Plane

  def land
  end

  def landed?
  end

  def take_off
    (weather == "sunny") ? true : false
  end

  def departed?
  end

private

  def weather
    Weather.new.status
  end



end
