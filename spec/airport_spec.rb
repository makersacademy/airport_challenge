require 'airport'

describe 'Airport' do
  describe '#land' do
    it 'lands plane at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end
