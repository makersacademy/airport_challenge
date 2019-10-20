require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'plane requests to land' do

    it { is_expected.to respond_to(:incoming_plane) }

    it 'does incoming_plane method take an instance of Plane as argument?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      expect { airport.incoming_plane(plane) }.to_not raise_error
    end

    it { is_expected.to respond_to(:planes_at_airport) }

    it 'does incoming_plane method push argument (plane) into planes_at_airport array' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.incoming_plane(plane)
      expect(airport.planes_at_airport).to include(plane)
    end

    it "does incoming_plane method raise and error if its stormy?" do
      allow(airport).to receive(:can_plane_take_off?).and_return(true)
      expect { airport.incoming_plane(plane) }.to raise_error "** No landings due to storm **"
    end



    it "if same instance of plane trys to land twice raise error" do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.incoming_plane(plane)
      expect{ airport.incoming_plane(plane) }.to raise_error "** Plane is already at airport **"
    end

    it "once the plane has landed is the instance on airport save to the planes @location instance variable?" do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.incoming_plane(plane)
      expect(plane.location).to eq airport
    end

  end

  context 'plane request to take off' do

    it { is_expected.to respond_to(:outgoing_plane) }

    it 'does incoming_plane method take an instance of Plane as argument?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      expect { airport.outgoing_plane(plane) }.to_not raise_error
    end

    it 'does outgoing_plane method remove argument (plane) from planes_at_airport array' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.incoming_plane(plane)
      airport.outgoing_plane(plane)
      expect(airport.planes_at_airport).to_not include(plane)
    end

    it 'does the user get noitfied when the plane has left the airport?' do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.incoming_plane(plane)
      expect(airport.outgoing_plane(plane)).to eq "Plane has left airport"
    end

    it "does outgoing_plane method raise and error if its stormy?" do
      allow(airport).to receive(:can_plane_take_off?).and_return(true)
      expect { airport.outgoing_plane(plane) }.to raise_error "** No take offs due to storm **"
    end

    it "once the plane has taken off is the string 'air' saved to the planes @location instance variable?" do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.outgoing_plane(plane)
      expect(plane.location).to eq "air"
    end

  end

end
