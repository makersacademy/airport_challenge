require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def land(plane)
    print "#{plane} has landed"
  end

  def take_off(plane)
    if stormy?
      raise "Cannot take off due to stormy conditions!"
    else
      print "#{plane} is no longer in airport"
    end
  end

end
