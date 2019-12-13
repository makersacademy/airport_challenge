require './lib/weather.rb'

class Plane

  def take_off
    fail "Too stormy to take off." if Weather.new.stormy?
    puts "#{Weather.new.stormy?}"
    @take_off = true
  end

  def out?
    @take_off
  end

end
