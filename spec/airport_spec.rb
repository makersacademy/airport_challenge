require 'airport'

describe Airport do

  describe '#take_off' do

    it 'plane takes off from airport' do
      plane = double :plane
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

  end

  describe '#land' do

    it 'lands plane at airport' do
      plane = double :plane
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

  end

end
