require 'airport'

describe Airport do
  it { is_expected.to respond_to :receive_plane }

  describe '#receive_plane' do
    it "lands a plane" do
      plane = Plane.new
      expect(subject.receive_plane(plane)).to eq plane
    end

    it 'raises an error when full' do
      subject.receive_plane(Plane.new)
      expect { subject.receive_plane Plane.new }.to raise_error 'airport full'
    end
  end

  describe '#depart_plane' do
    it "departs a plane" do
      plane = Plane.new
      expect(subject.depart_plane(plane)).to eq plane
    end
  end
end
