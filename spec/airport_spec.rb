require 'airport'

describe Airport do
  before do
  @plane = double(:plane)
  allow(@plane).to receive_lines([:land, :depart_plane])
end

end
   describe '#land_plane' do
    it "instructs a plane to land at an airport" do
      expect(subject).to receive(:land_plane)
      subject.land_plane
    end

    it "returns a status of landed" do
      subject.land_plane
      expect(subject.planes).to include(@plane)
    end

    it "gives error if airport full" do
      Airport::CAPACITY.times { subject.land_plane(@plane) }
      expect(subject.land_plane(@plane)).to raise_error("Full Airport. Keep flying!")
    end
  end


  describe '#take_off' do
    it "gives error if plane is not at the airport" do
      expect(subject.take_off(@plane)).to raise_error("There are no planes!")
    end

    it "gives instruction to take off" do
      expect(subject).to receive(:take_off)
      subject.take_off(@plane)

    it  "makes sure the plane has taken off" do
      subject.land_plane(@plane)
      subject.take_off(@plane)
      expect(subject.planes).to_not include(@plane)
    end
  end

  describe 'CAPACITY' do
    it "is the default capacity" do
      expect(subject.capacity).to eq Airport::CAPACITY
    end
  end
end
