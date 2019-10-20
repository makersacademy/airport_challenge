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
      expect { airport.incoming_plane(plane) }.to raise_error "** Already landed **"
    end

    it "once the plane has landed save airport instance to planes @location instance variable so it knows where it is!" do
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

    it "once the plane has taken off save string 'air' to planes @location instance variable so it knows where it is!" do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      airport.outgoing_plane(plane)
      expect(plane.location).to eq "air"
    end

  end

  context 'capacity' do

    it 'does the instant variable capacity equal the constant variable DEFULT_CAPACITY?' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "if airport is full raise error if plane trys to land" do
      allow(airport).to receive(:can_plane_take_off?).and_return(false)
      20.times {
        plane1 = Plane.new
        airport.incoming_plane(plane1)
      }
      expect { airport.incoming_plane(plane) }.to raise_error "** Airport is full **"
    end
  end

  it "can I override the maximum capacity when creating instances of Airport?" do
    small_airport = Airport.new(5)
    expect(small_airport.capacity).to eq 5
  end

end
