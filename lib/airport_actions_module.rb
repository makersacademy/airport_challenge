module AirportActions

private

  # Landing methods

  def plane_landing_confirmation(plane)
    plane.land_at(self) 
    return plane_already_landed_message if @hangar.include? plane

    assign_landing_confirmation(plane)
  end

  def assign_landing_confirmation(plane)
    case assign_random_weather
    when :stormy then denied_landing_bad_weather_message
    when :sunny then add_plane_to_hangar(plane)
    end
  end

  def plane_already_landed_message
    "Not possibile -> Plane already landed"
  end

  def plane_landed_message
    "Landed"
  end

  def denied_landing_no_space_message
    "Landing not possible"
  end

  def denied_landing_bad_weather_message
    "Stormy weather: landing denied"
  end

  # Takeoff methods

  def plane_take_off(plane)
    case assign_random_weather
    when :stormy then takeoff_message(:stormy)
    when :sunny
      remove_plane(plane)
      confirm_take_off(plane)
    end
  end

  def confirm_take_off(plane)
    return plane_has_not_left if @hangar.include?(plane)

    change_plane_status(plane) if plane.airport.name == name
  end

  def remove_plane(plane)
    @hangar.delete(plane)
  end

  def takeoff_message(weather_type)
    weather_type == :sunny ? plane_flying_message : plane_grounded_message
  end

  def plane_flying_message
    "Plane has taken off" 
  end

  def plane_grounded_message
    "Stormy weather: Take off denied" 
  end

  def plane_has_not_left_message
    "Plane has not taken off yet"
  end

  # Weather methods

  def assign_random_weather
    @weather ||= Weather.new
  end

  # Add plane to hangar methods - checking for space

  def add_plane_to_hangar(plane)
    check_if_hangar_space ? add_plane(plane) : denied_landing_no_space_message
  end

  def add_plane(plane)
    @hangar << plane
    plane_landed_message
  end

  def check_if_hangar_space
    @hangar.length < capacity
  end

  # Change plane status when taking off
  
  def change_plane_status(plane)
    plane.status = :flying
    plane.airport = nil
    takeoff_message(:sunny)
  end

end
