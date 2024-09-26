require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context "Air traffic control has requested you lands," do

    it { is_expected.to respond_to(:land) }

    it 'does land method take an instance of Airport as an argument?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      expect { plane.land(airport) }.to_not raise_error
    end

    it 'once the land method is called, does the instance of airport (the argument) call the
    incoming_plane method and take the plane (self) as an argument?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      expect(airport).to receive(:incoming_plane).with(plane)
      plane.land(airport)
    end

    it { is_expected.to respond_to(:location) }

    it 'is the instance of airport saved to @location?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      plane.land(airport)
      expect(plane.location).to eq airport
    end

  end

  context "Air traffic control has requested you takes of," do

    it { is_expected.to respond_to(:take_off) }

    it 'once the take_off method is called, does the instance of airport (saved in @location) call the
    outgoing_plane method and take the plane (self) as an argument?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      plane.land(airport)
      expect(plane.location).to receive(:outgoing_plane).with(plane)
      plane.take_off
    end

    it "stop raise error is plane is already in air" do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      air_traffic_control = AirTrafficControl.new
      air_traffic_control.land_plane_at_airport(plane, airport)
      air_traffic_control.take_off_from_airport(plane)
      expect { plane.take_off }.to raise_error "** Plane is in the air **"
    end

  end

end
