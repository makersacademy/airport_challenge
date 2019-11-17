require 'airport'

RSpec.describe 'Flights' do
  let(:the_sky) { Sky.new }
  let(:plane_a) { Plane.new }
  let(:plane_b) { Plane.new }
  let(:gatwick_airport) { Airport.new(60, the_sky) }
  let(:schiphol_airport) { Airport.new(160, the_sky) }
  let(:clear_day) { double(:weather, weather_report: :clear) }
  let(:stormy_day) { double(:weather, weather_report: :stormy) }
  
  it 'should be a successful journey' do
    # given a plane is signed off to travel,
    gatwick_airport.weather = clear_day.weather_report
    schiphol_airport.weather = clear_day.weather_report
    gatwick_airport.harbour_plane(plane_a)
    gatwick_airport.harbour_plane(plane_b)

    # when a plane takes off,
    gatwick_airport.commission_flight plane_a

    expect(plane_a.airborne).to be true

    # then it should travel through the sky,
    expect(the_sky.planes_in_transit).to include(plane_a)
    expect(gatwick_airport.hangar).not_to include(plane_a)

    # and safely land at its destination.
    schiphol_airport.harbour_plane(plane_a)

    expect(plane_a.airborne).to be false
    expect(schiphol_airport.hangar).to include(plane_a)
    expect(the_sky.planes_in_transit).not_to include(plane_a)
    expect { schiphol_airport.harbour_plane plane_b }.to raise_error Errors::CURRENTLY_GROUNDED
  end
end
