class ATC
  def check_weather
    @weather = "stormy"
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
# luton = ATC.new
# luton.check_weather
