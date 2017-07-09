require 'airport'

describe Airport do

  let(:plane) { double('plane') }

  describe '#port_plane' do
    it 'ports the plane in the airport' do
      subject.port_plane(plane)
      expect(subject.plane).to eq plane
    end
  end

  describe '#release_plane' do
    it 'releases the plane in the airport' do
      subject.release_plane
      expect(subject.plane).to eq nil
    end
  end

end
