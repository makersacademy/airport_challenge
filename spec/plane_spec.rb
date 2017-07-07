require 'plane'

describe Plane do
  let(:plane) { double(:plane, landed?: true) }
  it { is_expected.to respond_to(:status?) }

  describe 'Plane functions' do
    it 'check if plane has landed' do
      subject.landing
      expect(subject.status?).to eq true
    end

    it 'check if plane has taken off' do
      subject.take_off
      expect(subject.status?).to eq false
    end
  end
end
