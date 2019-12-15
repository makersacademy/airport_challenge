require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :land }
  
  describe '#land' do
    it "should return a plane" do
      plane = @plane
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it "lets a plane take off" do
      plane = Plane.new
      expect(subject.take_off(plane)).to_not eq plane.at_airport?
    end
  end
end
