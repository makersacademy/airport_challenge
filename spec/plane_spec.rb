require 'plane'

describe Plane do
 subject(:plane) { described_class.new } 
  
  describe '#land' do
    
    it { is_expected.to respond_to(:land) } #.with(1).argument }
 
    it 'should make landed = true' do
      subject.land
    expect(subject.landed?).to eq true
    end
   end

  describe '#landed?' do
  
    it { is_expected.to respond_to(:landed?) }
  
  end

#  describe '#status' do
  
 #   it { is_expected.to respond_to(:report_landed) }
 # end
   

  end


