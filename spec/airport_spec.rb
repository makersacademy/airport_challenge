require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane, in_air?: true, flying: true, grounded: false }

  it { is_expected.to be_an_instance_of Airport }

  it "has no planes when created" do
    expect(airport.spaces).to be_empty
  end

  context "landing a flying plane" do
    before do
      airport.land(plane)
    end
    
    it "can land a plane" do
      expect(airport.spaces).to include(plane)
    end

    it "can instruct a plane to take off and confirm plane is gone" do
      allow(plane).to receive(:in_air?).and_return(false)
      airport.takeoff(plane)
      expect(airport.spaces).not_to include(plane)
    end

    it "cannot takeoff a plane that is flying" do
      plane.flying
      expect { airport.takeoff(plane) }.to raise_error("Plane already flying")
    end
  end

  it "cannot land planes if full" do
    airport.capacity.times { 
      airport.land(plane)
      plane.flying
    }
    expect { airport.land(plane) }.to raise_error("Airport full, landing denied.")
  end
  
  it "capacity can be changed" do
    new_airport = Airport.new(200)
    200.times { 
      new_airport.land(plane)
      plane.flying
    }
    expect { new_airport.land(plane) }. to raise_error("Airport full, landing denied.")
  end

  it "cannot takeoff a plane if airport empty" do
    expect { airport.takeoff(plane) }.to raise_error("There are no planes to take off")
  end

  it "cannot land a plane that is grounded" do
    allow(plane).to receive(:in_air?).and_return(false)
    expect { 
      plane.grounded
      airport.land(plane) 
    }.to raise_error("Plane already landed")
  end
end
