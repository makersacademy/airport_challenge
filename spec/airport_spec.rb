require "airport"

describe Airport do
  let (:plane) { double(:plane, land: true) }
  let (:airport) { Airport.new }

  # it "checks a plane has landed" do
  #   plane.land(airport)
  #   expect(airport.hanger).to include plane
  # end

  
end
