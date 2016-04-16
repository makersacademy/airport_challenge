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
    
    it "when weather is stormy cannot receive planes" do
      allow(subject).to receive(:ready_for_landing?).and_return false
      expect{ plane.land(subject) }.to raise_error(RuntimeError, "Cannot land")
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
      expect(plane.take_off(subject)).to eq "Plane #{plane} has taking off from #{subject.name}"
      expect(plane.status).to eq :flying
      expect(subject.planes).not_to include plane
    end
    
    it "when weather is stormy cannot release planes" do
      allow(subject).to receive(:ready_for_taking_off?).and_return false
      expect{ plane.take_off(subject) }.to raise_error(RuntimeError, "Cannot take off")
      expect(subject.planes).to include plane
    end
  end
end