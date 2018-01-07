require 'airport'

module Helpers
  def land_plane_clear_weather(airport, weather, plane)
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
  end
  
  def land_plane_stormy_weather(airport, weather, plane)
    allow(weather).to receive(:rand).and_return(5)
    airport.land(plane)
  end
end
