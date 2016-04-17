require 'airport'
require 'plane'

describe Airport do
  subject { described_class.new("El Dorado", Plane) }
  let(:plane) { subject.planes.first }
  let(:other_airport) { Airport.new("Other airport", Plane) }
  it { is_expected.to respond_to :receive_plane }
  it { is_expected.to respond_to :release_plane }
  it { is_expected.to respond_to :ready_for_landing? }
  it { is_expected.to respond_to :ready_for_taking_off? }
  
  describe "Initialization" do
    it "has a default capacity if none is passed" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    
    it "can be initialized with a different value" do
      airport = Airport.new("JFK", Plane, 50)
      expect(airport.capacity).to eq 50
    end
  end
  
  describe "Landing" do
    # Before each landing test, the plane must be flying
    before(:each) do
      allow(subject).to receive(:ready_for_taking_off?).and_return true
      plane.take_off(subject)
    end
    
    it "when weather is sunny can receive planes" do
      allow(subject).to receive(:ready_for_landing?).and_return true
      expect(plane.land(subject)).to eq "Plane #{plane} has landed at #{subject.name}"
      expect(subject.planes).to include plane
    end
    
    it "when weather is stormy cannot receive planes and raises error" do
      allow(subject).to receive(:ready_for_landing?).and_return false
      plane.land(subject)
      expect(subject.planes).not_to include plane
    end
  end
    
  describe "Taking off" do
    # Before each taking off test, the plane must be at the airport (landed)
    before(:each) do
      allow(subject).to receive(:ready_for_taking_off?).and_return true
      plane = subject.planes.last
    end
    
    it "when sunny instructs a plane to take-off and confirms that it is flying" do
      expect(plane.take_off(subject)).to eq plane
      expect(plane.status).to eq :flying
      expect(subject.planes).not_to include plane
    end
    
    it "when weather is stormy cannot release planes and raises error" do
      allow(subject).to receive(:ready_for_taking_off?).and_return false
      plane.take_off(subject) 
      expect(subject.planes).to include plane
    end
  end
end