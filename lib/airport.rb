require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def land(plane)
    raise "Cannot land due to stormy conditions!" if stormy?
    print "#{plane} has landed"
  end

  def take_off(plane)
    raise "Cannot take off due to stormy conditions!" if stormy?
    print "#{plane} is no longer in airport"
  end

end
