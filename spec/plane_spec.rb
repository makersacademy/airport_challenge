require 'plane'

describe Plane do 
  subject(:plane) { described_class.new }  
  let(:mockAirport) { double :airport }

  describe '#initialize' do
    it 'defaults #flying as false' do 
      expect(subject.flying).to be false
    end
  end

  describe '#flying?' do 
    it { is_expected.to respond_to(:flying?) }
  end  
  describe '#grounded?' do 
    it { is_expected.to respond_to(:grounded?) }
  end

end
