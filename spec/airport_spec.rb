require 'airport'

describe Airport do
  it { is_expected.to respond_to :receive_plane }

  describe '#receive_plane' do
    it "lands a plane" do
      plane = Plane.new
      expect(subject.receive_plane(plane)).to eq plane
    end
  end

end
