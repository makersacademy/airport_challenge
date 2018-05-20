require 'Airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#add_plane' do
    it 'can add a plane to the airport' do
      subject.add_plane(plane)
      expect(subject.planes.last).to eq plane
      expect(subject.planes.length).to eq 1
    end
    it 'can add 20 planes to the airport' do
      20.times { subject.add_plane(plane) }
      expect(subject.planes.length).to eq 20
    end
  end

end
