class ATC
  def check_weather
    "stormy"
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

atc = ATC.new
p atc
p atc.check_weather
atc.land_plane
atc.takeoff_plane
