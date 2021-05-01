require_relative 'weather'

class ATC
  def initialize
    weather = Weather.new
    @weather = weather.report
  end

  def check_weather
    fail 'No weather report' if @weather.empty?
    fail 'Storm warning' if @weather == "stormy"
    @weather
  end

  def land_plane
   if self.check_weather == "stormy"
     puts "Can't land - too stormy"
   end
  end

  def takeoff_plane
    if self.check_weather == "stormy"
      puts "Can't takeoff - too stormy"
    end
  end
end

#feature testing
atc = ATC.new
p atc
p atc.check_weather
atc.land_plane
atc.takeoff_plane
