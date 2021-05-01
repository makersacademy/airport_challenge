require_relative 'weather'

class ATC
  def initialize
  end

  def check_weather(weather)
    @weatherstatus = weather.report
    fail 'No weather report' if @weatherstatus.empty?
    
    fail 'Storm warning' if @weatherstatus == "stormy"
    
    @weatherstatus
  end

  def land_plane
    if check_weather == "stormy"
      puts "Can't land - too stormy"
    end
  end

  def takeoff_plane
    if check_weather == "stormy"
      puts "Can't takeoff - too stormy"
    end
  end
end

# feature testing
# atc = ATC.new
# p atc
# p atc.check_weather
# atc.land_plane
# atc.takeoff_plane
