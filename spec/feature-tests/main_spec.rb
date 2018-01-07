require 'airport'

describe 'Main feature test' do
  airport = Airport.new
  plane1 = Plane.new
  plane2 = Plane.new
  plane3 = Plane.new
  it 'lands planes in any order and allows them to take off again' do
    allow(airport.weather).to receive(:stormy?).and_return false
    expect do
      airport.land plane2
      airport.land plane1
      airport.take_off plane1
      airport.land plane3
      airport.take_off plane2
      airport.take_off plane3
    end.to_not raise_error
  end
end
