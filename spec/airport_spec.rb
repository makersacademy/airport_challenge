require 'airport'

describe Airport do

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land plane).to eq plane
    end
  end

  describe '#fly' do
    it 'instructs plane to take off' do
      plane = Plane.new
      expect(subject.fly plane).to eq plane
    end
  end

end
