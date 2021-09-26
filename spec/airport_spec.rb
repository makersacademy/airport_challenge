require 'airport'
require 'plane'

describe Airport do

  describe '#land' do
    it "instruct planes to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  
    it "raises an error when full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it "instruct planes to take off" do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

end
