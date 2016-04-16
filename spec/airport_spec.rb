require 'airport'
require 'plane'

describe Airport do
  subject { Airport.new Plane }
  let(:plane) { subject.planes.first }
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
      expect(plane.land(subject)).to eq "Plane has landed"
      expect(subject.planes).to include plane
    end
    
    it "when weather is stormy cannot receive planes" do
      allow(subject).to receive(:ready_for_landing?).and_return false
      expect{ plane.land(subject) }.to raise_error(RuntimeError, "Cannot land")
      expect(subject.planes).not_to include plane
    end
    
    it "a landed plane cannot land again" do
      plane = subject.planes.pop
      expect(plane.land(subject)).to eq "Plane is already landed"
    end
    
    it "a plane cannot land in a full airport" do
      allow(subject).to receive(:full?).and_return true
      expect{ plane.land(subject) }.to raise_error(RuntimeError, "Cannot land")
    end
  end
    
  describe "Taking off" do
    xit "instruct a plane to take-off and confirm that it is flying" do
      airport.release_plane(plane2)
      expect(airport.planes).not_to include plane2
      expect(plane2.take_off).to eq :flying
    end
  end
    
end