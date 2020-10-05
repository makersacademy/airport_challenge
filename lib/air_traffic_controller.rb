require 'system_designer'

class AirTrafficController
  def instruct_to_land
    "a plane can land at the airport"
  end

  def instruct_to_take_off
    "a plane can take off from the airport, and it is confirmed that it is no longer in the airport"
  end

  def prevent_plane_landing_airport_is_full
    "a plane cannot land at the airport as the airport is full"
  end

  def random_weather
    if rand(1..2) == 1
      return 1
    else
      return 2
    end
  end

  def prevent_landing_due_to_weather
    "a plane cannot land at the airport due to bad weather"
  end

  def prevent_takeoff_due_to_weather
    "a plane cannot take off from the airport due to bad weather"
  end

  def plane_status
    true
  end

end
