require 'airport'
require 'plane'

describe Airport do
  it 'creates a new airport object' do
    airport = Airport.new
  end   

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :take_off }

  describe '# land' do
    it 'accepts a plane to land' do
      plane = Plane.new
      expect(subject.land(plane).count).to eq 1
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end
end
