require "airport"
require "plane"

describe Airport do 
  subject(:airport) {described_class.new}                     
  let(:plane) {double :plane}                                 
 
  context "plane will land" do                                
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "will be added to hanger" do
      expect(subject.land(:plane)).to eq(1)                   
    end
  end

  context "plane will take off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it "will be removed from hangar" do
      expect(subject.take_off(:plane)).to eq(0)
    end
  end
 
  context "hangar is full" do
    it "will prevent a plane landing when airport is full" do
      10.times {subject.land(:plane)}
      expect{subject.land(:plane)}.to raise_error "Hangar full"
    end
  end
      

end

