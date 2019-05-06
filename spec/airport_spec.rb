require 'airport'

describe Airport do
  plane = Plane.new
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe '#take_off' do
    it "a plane can take off" do
      plane = subject.take_off
    end
  end
end
