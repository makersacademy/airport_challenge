require 'airport'

shared_context "common" do
  let(:plane) {Plane.new}
end

describe Airport do
  
  include_context "common"

  it "should have a default capacity of 20" do
    expect(subject).to have_attributes(capacity: 20)
  end
  
  describe '#land' do

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

end

