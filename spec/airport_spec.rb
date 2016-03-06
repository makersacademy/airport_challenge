require 'airport.rb'

describe Airport do
 let(:plane) { double(:plane, land:nil, take_off:nil) }
  describe '#land' do
    it { is_expected.to respond_to :land }

    it 'Should land a plane' do
      2.times { subject.land(plane) }
      expect(subject.airfield.size).to eq 2
    end

  end

  describe '#confirm_landing' do
    it 'Confirms landing' do
      subject.land(plane)
      expect(subject.confirm_landing(plane)).to eq true
    end
  end

  describe '#dispatch' do
    it { is_expected.to respond_to(:dispatch).with(1).argument }

    it 'Dispaches the plane' do
      subject.land(plane)
      subject.dispatch(plane)
      expect(subject.airfield.size).to eq 0
    end
  end

  describe '#confirm_dispatch' do
    it 'Confirms dispatch' do
      subject.land(plane)
      subject.dispatch(plane)
      expect(subject.confirm_dispatch(plane)).to eq true
    end
  end
end
