require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  it 'instructs a plane to land at an airport' do
    plane1 = Plane.new
    expect(airport.land(plane1)).to eq plane1
  end

  it 'confirms that the plane has landed' do
    plane1 = Plane.new
    airport.land(plane1)
    expect(airport.plane).to eq plane1
  end

  it {is_expected.to respond_to(:take_off).with(1).argument}

  it 'instructs plane to take off from airport' do
    plane1 = Plane.new
    airport.land(plane1)
    expect(airport.take_off(plane1)).to eq nil
  end

  it 'confirms that plane is no longer in the airport' do
    plane1 = Plane.new
    airport.land(plane1)
    airport.take_off(plane1)
    expect(airport.plane).to eq nil
  end

end
