require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe 'plane functions' do
    it 'lands plane at airport' do
      airport_planes = subject.land_plane(plane)
      expect(subject.land_plane(plane)).to eq airport_planes
    end
  end

end
