require 'plane'

describe Plane do
  subject(:plane) { described_class.new } 
  
  describe '#land' do
    
    it { is_expected.to respond_to(:land) }
 
    it 'should make landed = true' do
        subject.land
        expect(subject.landed?).to eq true
    end
   
#    it 'should call airport.land(plane)' do
#       allow(airport).to receive(:land).and_return(true)
# 
#          expect(airport).to receive(:land).with(plane)
#          subject.land(airport)
#    end
#      
  end
  
  describe '#landed?' do
   # let(:airport) { double :airport }
    
    it { is_expected.to respond_to(:landed?) }
  
    it 'will return false when a plane has taken off' do
      subject.take_off
      expect(subject.landed?).to eq false
    end
  end
end

#  describe '#status' do
  
 #   it { is_expected.to respond_to(:report_landed) }
 # end
   



