require './spec/spec_helper.rb'

RSpec.feature "Air Traffic Controller" do
  scenario "Plane lands in airport" do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new(90)
    expect(airport.plane_lands(plane, weather)).to eq airport.planes
  end
end
