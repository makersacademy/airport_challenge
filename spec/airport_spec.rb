require 'airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it {is_expected.to respond_to(:incoming_plane)}

  it 'does incoming_plane method take an instance of Plane as argument?' do
    expect{airport.incoming_plane(plane)}.to_not raise_error
  end

end
