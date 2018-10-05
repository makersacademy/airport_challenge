require 'airport'

describe Airport do
  it { is_expected.to respond_to :release_plane }

  #it "releases a plane that has landed" do
  #  plane = subject.release_plane
  #  expect(plane).to be_landed
  #end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it "lands the plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "returns the landed planes" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

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
end
