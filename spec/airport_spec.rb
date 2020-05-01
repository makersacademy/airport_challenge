require 'airport.rb'
describe Airport do
  describe "#land" do
    it 'instructs a plane to land at airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end
  end
    it 'stops a plane from landing by raising an error when airport is full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}. to raise_error 'The airport is full, you cannot land'
    end
  describe '#takeoff' do
    it 'instructs a plane to take off and confirms its no longer at airport' do
      expect(subject.takeoff).to eq("The plane instructed has now left the airport")
    end
  end
end
