require 'air_traffic_control'

describe AirTrafficControl do
  let(:air_traffic_control) {AirTrafficControl.new}
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}

  it {expect(subject).to respond_to :land_plane_at_airport}

  it 'does land_plane_at_airport method take two arguments? an instance of Plane and an instance of airport...' do
    expect{air_traffic_control.land_plane_at_airport(plane,airport)}.to_not raise_error
  end

  # it 'does land_plane_at_airport method take an instance of Plane and return it?' do
  #
  #   plane = Plane.new
  #   expect(air_traffic_control.land_plane_at_airport(plane)).to eq plane
  # end

  it 'does land_plane_at_airport call land method on the Plane instance with an instance of Airport as an argument?' do
    expect(plane).to receive(:land).with(airport)
    air_traffic_control.land_plane_at_airport(plane,airport)
  end


end
