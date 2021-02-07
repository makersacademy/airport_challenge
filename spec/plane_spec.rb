require 'plane'

describe Plane do
  let(:plane) { Plane.new("airborne") }

  it 'plane class exists in program' do
    expect(plane).to be_a(Plane)
  end

  describe '#land' do
    it 'land allows plane to land at airport' do
      airport = double("airport", :status => "open")
      expect { plane.land(airport) }.to change { plane.location }.from("airborne").to(airport)
    end
    it 'plane cannot land if not already airborne' do
      airport = double("airport")
      plane = Plane.new(airport)
      expect { plane.land(airport) }.to raise_error("Warning: plane is not airborne")
    end
    it 'plane cannot land if airport is closed' do
      airport = double("airport", :status => "closed")
      expect { plane.land(airport) }.to raise_error("Cannot land: airport is closed")
    end

  end

  describe '#takeoff' do
    it 'takeoff allows plane to leave airport' do
      airport = double("airport", :status => "open")
      plane = Plane.new(airport)
      expect { plane.takeoff(airport) }.to change { plane.location }.from(airport).to("airborne")
    end
    it 'plane cannot takeoff if already airborne' do
      airport = double("airport")
      expect { plane.takeoff(airport) }.to raise_error("Warning: plane is already airborne")
    end
    it 'plane cannot takeoff if not at correct airport' do
      heathrow = double("airport")
      gatwick = double("airport")
      plane = Plane.new(heathrow)
      expect { plane.takeoff(gatwick) }.to raise_error("Warning: plane is not at that airport")
    end
    it 'plane reports successful takeoff to ATC' do
      airport = double("airport", :status => "open")
      plane = Plane.new(airport)
      expect { plane.takeoff(airport) }.to output(/Plane has taken off successfully and is now airborne/).to_stdout
    end
    it 'plane cannot take off if airport is closed' do
      airport = double("airport", :status => "closed")
      plane = Plane.new(airport)
      expect { plane.takeoff(airport) }.to raise_error("Cannot take off: airport is closed")
    end
  end
end
