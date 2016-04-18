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
    it "has a default capacity if none is given" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    
    it "can be initialized with a different value" do
      airport = Airport.new("JFK", Plane, 50)
      expect(airport.capacity).to eq 50
    end
  end
  
  describe "Methods" do
    let(:dummy_plane) { double(:plane) }
    
    it "receives a plane" do
      subject.receive_plane dummy_plane
      expect(subject.send(:planes)).to include dummy_plane
    end
    
    it "releases a plane" do
      subject.release_plane plane
      expect(subject.send(:planes)).not_to include plane
    end
    
    it "allows the planes to land if conditions are met" do
      allow(subject).to receive(:check_weather).and_return :sunny
      allow(subject).to receive(:full?).and_return false
      expect(subject.ready_for_landing?).to be true
    end
    
    it "does not allow landing if conditions are not met" do
      allow(subject).to receive(:check_weather).and_return :stormy
      expect(subject.ready_for_landing?).to be false
    end
    
    it "allows the planes to take off if conditions are met" do
      allow(subject).to receive(:check_weather).and_return :sunny
      expect(subject.ready_for_taking_off?).to be true
    end
    
    it "does not allow taking off if conditions are not met" do
      allow(subject).to receive(:check_weather).and_return :stormy
      expect(subject.ready_for_taking_off?).to be false
    end
  end
end