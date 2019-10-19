require 'plane'

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}

  it {is_expected.to respond_to(:land)}

  it 'does land method take an instance of Airport as an argument?' do
    expect{plane.land(airport)}.to_not raise_error
  end

  it 'does the instance of airport call the incoming plane method and take the plane (self) as an argument?' do
    expect(airport).to receive(:incoming_plane).with(plane)
  plane.land(airport)
  end

end
