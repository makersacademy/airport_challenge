require 'airport.rb'

describe Airport do

  describe "#land_plane" do
    it { is_expected.to respond_to :land_plane }

    it "accepts a plane to land" do
      plane = double(:plane)
      subject.land_plane(plane)
      expect(subject.count_planes).to eq 1
    end

    it "accepts multiple planes" do
      plane = double(:plane)
      10.times { subject.land_plane(plane) }
      expect(subject.count_planes).to eq 10
    end
  end

  describe "#take_off" do
    it "lets a plane take off" do
    plane = double(:plane)
    subject.planes << [plane,plane]
    subject.take_off(plane)
    expect(subject.count_planes).to eq 1
    end
  end

end
