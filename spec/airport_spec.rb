require 'airport'
require 'plane'

describe Airport do
  it 'creates a new airport object' do
    airport = Airport.new
  end   

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '# land' do
    it 'accepts plane to land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end
