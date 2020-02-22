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
      expect{subject.land(plane)}.to change{subject.hanger.length}.by(1)
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

  end

  describe '#full' do
    # airport responds to full method
    it { is_expected.not_to respond_to(:full?) }

    it "will not allow a plane to land if the hanger is full" do
      20.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("airport full")
    end
  end  


end

