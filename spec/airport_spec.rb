require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :plane_take_off }

  describe "#plane_take_off" do
    it "should confirm the plane is no longer in the airport" do
      subject = Airport.new
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.plane_take_off).to eq("The plane is no longer in the airport")
    end

    it "should not take off when weather is stormy" do
      subject = Airport.new
      allow(subject).to receive(:rand).and_return(3)
      expect { subject.plane_take_off }.to raise_error "Stormy weather: not possible to take off"
    end

  end

  describe "#land_plane" do
    it "shouldn't land if airport is full (max capacity 1) " do
      subject = Airport.new(1)
      subject.land_plane
      expect { subject.land_plane }.to raise_error "Landing not possible, airport is full"
    end

    it "should have a default capacity of 5 and raise error when capacity is full" do
      subject = Airport.new
      5.times { subject.land_plane }
      expect { subject.land_plane }.to raise_error "Landing not possible, airport is full"
    end
  end
end
