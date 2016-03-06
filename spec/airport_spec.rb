require 'airport.rb'

describe Airport do
 let(:plane) { double(:plane, land:true) }
  describe '#land' do

    it { is_expected.to respond_to 'land'}

    it 'Should land a plane' do
      2.times { subject.land(plane) }
      expect(subject.airfield.size).to eq 2
    end

    it 'Confirms landing' do
      subject.land(plane)
      expect(subject.confirm_landing(plane)).to eq true
    end
  end

end
