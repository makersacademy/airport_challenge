require './lib/weather.rb'

class Plane

  def take_off
    @take_off = true
  end

  def out?
    @take_off
  end

end
