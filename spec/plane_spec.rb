require 'plane'

describe Plane do
  let(:plane) { Plane.new("airborne") }

  it 'plane class exists in program' do
    expect(plane).to be_a(Plane)
  end

  describe '#land' do

    it 'land allows plane to land at airport' do
      airport = double("airport")
      expect { plane.land(airport) }.to change { plane.location }.from("airborne").to(airport)
    end
    it 'plane cannot land if not already airborne' do
      airport = double("airport")
      plane = Plane.new("airport")
      expect { plane.land(airport) }.to raise_error("Warning: plane is not airborne")
    end
  end
end
