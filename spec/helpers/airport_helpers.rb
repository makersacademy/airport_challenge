module AirportHelpers

  def overrides_weather_and_plane_location
    allow(test_airport).to receive(:check_weather)
    allow(landing_plane).to receive(:update_location)
  end

  def overrides_plane_location
    allow(landing_plane).to receive(:update_location)
  end

  def overrides_weather
    allow(test_airport).to receive(:check_weather)
  end

  def lands_a_plane
    test_airport.land(landing_plane)
  end

  def lands_a_new_plane
    test_airport.land(new_plane)
  end

  def fills_airport_to_capacity
    test_airport.capacity.times { lands_a_plane }
  end

  def sets_weather_to_stormy
    allow(test_airport).to receive(:check_weather) { test_airport.stormy = true }
  end

  def sets_plane_location
    allow(landing_plane).to receive(:location) { 'Airport' }
  end

  def plane_takes_off
    test_airport.take_off(landing_plane)
  end

  def move_new_plane_to_hangar
    test_airport.move_to_hangar(new_plane)
  end

  def move_not_new_plane_to_hangar
    test_airport.move_to_hangar(landing_plane)
  end

end
