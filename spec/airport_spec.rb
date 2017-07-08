require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it 'confirms aircraft can land' do
    expect{airport.confirm_land(plane)}.to_not raise_error
  end

  it 'confirms aircraft has landed' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it 'denies landing if airport is full' do
    @airport1 = Airport.new
    10.times {@airport1.land(Plane.new)}
    expect {@airport1.confirm_land(Plane.new)}.to raise_error("Landing denied: Airport full")
  end

end
