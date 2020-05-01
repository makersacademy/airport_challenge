require 'airport.rb'
describe Airport do
  describe "#land" do
    it 'instructs a plane to land at airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end
  end

  describe '#takeoff' do
    it 'instructs a plane to take off and confirms its no longer at airport' do
      expect(subject.takeoff).to eq("The plane instructed has now left the airport")
    end
  end
end
