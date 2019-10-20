require 'air_traffic_control'

describe AirTrafficControl do
  let(:air_traffic_control) {AirTrafficControl.new}
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}

  context "request plane to land," do

    it {expect(subject).to respond_to :land_plane_at_airport}

    it 'does land_plane_at_airport method take two arguments? an instance of Plane and an instance of airport...' do
      expect{air_traffic_control.land_plane_at_airport(plane,airport)}.to_not raise_error
    end

    it 'does land_plane_at_airport call land method on the Plane instance with an instance of Airport as an argument?' do
      expect(plane).to receive(:land).with(airport)
      air_traffic_control.land_plane_at_airport(plane,airport)
    end
  end

  context "request plane to take off," do

    it {is_expected.to respond_to(:take_off_from_airport)}

    it "***stub example***  does take_off_from_airport method take instance of Plane arguments?" do
      allow(plane).to receive(:take_off)
      expect{air_traffic_control.take_off_from_airport(plane)}.to_not raise_error
    end

    it 'does take_off_from_airport call take_off method on the Plane instance?' do
      expect(plane).to receive(:take_off)
      air_traffic_control.take_off_from_airport(plane)
    end

  end


end
