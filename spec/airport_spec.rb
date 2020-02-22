require 'airport'

shared_context "common" do
  let(:plane) {Plane.new}
end

describe Airport do
  
  include_context "common"

  it "should have a default capacity of 20" do
    expect(subject).to have_attributes(capacity: 20)
  end

  it "should be able to change the default capacity" do
    airport = Airport.new(10)
    expect(airport).to have_attributes(capacity: 10) 
  end
  
  describe '#land' do
    # airport responds to land method with 1 plane 
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "puts a plane in the hanger once it has landed" do
      allow(subject).to receive(:stormy?) { false }
      expect{subject.land(plane)}.to change{subject.hanger.length}.by(1)
    end
    it "raises an error if the weather is too stormy to land" do
      allow(subject).to receive(:stormy?) { true }
      expect{subject.land(plane)}.to raise_error("It's too stormy to land")
    end
  end

  describe '#takeoff' do

    it "removes a plane in the hanger when it takes off" do
      subject.land(plane)
      expect{subject.takeoff}.to change{subject.hanger.length}.by(-1)
    end
    it "gives a message confirming the plane has left" do
      subject.land(plane)
      expect{subject.takeoff}.to output("A plane has left the airport\n").to_stdout
    end
    it "raises an error if the weather is too stormy to takeoff" do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect{subject.takeoff}.to raise_error("It's too stormy to take off")
    end

  end

  describe '#full' do
    # airport responds to private full method
    it { is_expected.not_to respond_to(:full?) }

    it "will not allow a plane to land if the hanger is full" do
      allow(subject).to receive(:stormy?) { false }
      20.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("airport full")
    end
  end  

  describe '#stormy' do
  # airport responds to private stormy method
  it { is_expected.not_to respond_to(:stormy?) }

  end

end

