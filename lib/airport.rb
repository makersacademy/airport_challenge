class Airport

FULL_CAPACITY = 21

attr_reader :stormy_weather, :capacity, :good_weather

def initialize(capacity, stormy_weather)
  @capacity = capacity
  @stormy_weather = stormy_weather
  @planes = []

end

  def land(new_plane)
        if @capacity >= FULL_CAPACITY
          raise " Full capacity "
        elsif @stormy_weather == true
         raise " Not allowed to land stormy weather "
        elsif @stormy_weather == false
            @planes.push(new_plane)
        else
        end
  end


  def take_off
      if  @capacity == 0
        fail " There is no longer plane in the airport "
      elsif @stormy_weather == true
        false
      elsif
        @stormy_weather == false
        @planes.pop
        return @planes.count
      end
  end

# def confirm_no_plane(plane)
#
#    if @capacity == 0
#      true
#    elsif @capacity <= 20
#      false
#    end
# end
end
