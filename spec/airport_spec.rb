require 'airport'

describe Airport do

  describe '#landing' do
    it 'allows planes to land' do
      plane = Plane.new
      weather = Weather.new
      expect(subject.land(plane)).to eq [plane]
    end
  end
end
