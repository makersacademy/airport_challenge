require_relative 'airport'
require_relative 'weather'
require_relative 'messages_module'
require_relative 'weather'
class Plane
include Messages
include Weather
attr_accessor :flying

  def land_at(airport)

    if landing_bay_same_as_capacity?(airport)
      return loading_bay_is_too_full_to_land_planes
    end


    if the_weather_is_sunny?
    puts plane_landed_message
    @flying = false
    return make_plane_land_in_landing_bay(airport)

    else
      bad_weather_message
    end

  end

  def take_off_from(airport)

    if the_weather_is_sunny?
        puts plane_taken_off_message
        @flying = true
        return  plane_leaves_loading_bay(airport) #delete method deletes froma array and returns

     else
        bad_weather_message
     end

  end

  def switch_flying
    switch_to_opposite_value
 end

  private

  def the_weather_is_sunny?
    weather_today == "Sunny"
  end

  def plane_leaves_loading_bay(airport)
    airport.landing_bay.delete(self)
  end

  def landing_bay_same_as_capacity?(airport)
    airport.landing_bay.length == airport.capacity
  end


  def make_plane_land_in_landing_bay(airport)
    airport.landing_bay << self
  end



  def switch_to_opposite_value
    if @flying == false
     @flying = true
   else @flying == true
     @flying = false
   end
 end




end
