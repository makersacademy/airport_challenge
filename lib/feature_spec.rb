require 'airport'
require 'plane'

RSpec.describe 'full scenario test of airport challenge' do
  before(:all) do
    large_airport = Airport.new(200)
    allow(large_airport).to receive(:stormy_weather?) { nil }
    medium_airport = Airport.new
    allow(medium_airport).to receive(:stormy_weather?) { true }
    small_airport = Airport.new(5)
    allow(small_airport).to receive(:stormy_weather?) { nil }
    planes = { plane1: Plane.new,
               plane2: Plane.new,
               plane3: Plane.new,
               plane4: Plane.new,
               plane5: Plane.new,
               plane6: Plane.new
             }
    large_airport.land(planes[:plane1])
    large_airport.land(planes[:plane2])
    large_airport.land(planes[:plane3])
    large_airport.land(planes[:plane4])
    large_airport.land(planes[:plane5])
  end

end
