require 'airport'
require 'plane'

describe Airport do

  describe '#land' do
    it "lets planes land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  
    it "raises an error when full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end
  
end
