require 'airport'

describe Airport do
  it { is_expected.to respond_to(:recieve_plane) }
  it { is_expected.to respond_to(:release_plane) }

  describe '#recieve_plane' do
    it 'recieves plane' do
      plane = Plane.new
      expect(subject.recieve_plane(plane)).to eq [plane]
    end

  end

  describe '#release_plane' do
    it 'releases plane' do
      plane = Plane.new
      subject.recieve_plane(plane)
      expect(subject.release_plane).to eq plane
    end
  end

end
