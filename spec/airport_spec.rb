require 'airport'

describe Airport do
  describe '#initialize' do
    it 'creates an empty airport' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end
end
