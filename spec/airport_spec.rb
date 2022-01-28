require 'airport'

describe Airport do
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).arguments }
    it "should let a plane land at the airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it { expect(subject).to respond_to(:take_off).with(1).arguments }
  end
end