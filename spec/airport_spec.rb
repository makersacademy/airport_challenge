require 'airport'

describe Airport do
  it { is_expected.to respond_to :release_plane }

  it { is_expected.to respond_to(:land).with(1).argument }

#  it "lands the plane" do
#    plane = Plane.new
#    expect(subject.land(plane)).to eq plane
#  end

#  it "returns the landed planes" do
#    plane = Plane.new
#    subject.land(plane)
#    expect(subject.plane).to eq plane
#  end

  describe "#release_plane" do
    it "releases a plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.release_plane).to eq plane
    end
  end

  describe "#release_plane" do
    it "raises an error message when there are no planes at the airport which can take off" do
      expect { subject.release_plane }.to raise_error "No planes at the airport to take off"
    end
  end

  describe '#land' do
    it 'raises an error when full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error "Airport is full"
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "initialization" do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end
  end

end
