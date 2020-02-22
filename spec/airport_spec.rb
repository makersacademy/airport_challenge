require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe "#land" do
    it "should land plane at airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do
    it "returns nil if no planes in airport" do
      expect(subject.take_off).to eq nil
    end

    it "confirms plane has left airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq "Plane has left the airport"
    end
  end

end
