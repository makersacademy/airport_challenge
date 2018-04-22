require 'spec_helper'

RSpec.feature "Air traffic controller" do
  scenario "Lands 5 planes at an airport" do
    planes = Array.new(5) { Plane.new }
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.capacity).to eq Airport::DEFAULTS[:capacity]
    planes.each do |plane|
      airport.land(plane)
    end
    expect(airport.planes).to eq planes
  end
end
