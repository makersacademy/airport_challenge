require 'plane'

describe Plane do

  it { is_expected.to respond_to(:landed?) }
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  let(:airport) {double(:airport)}
  describe '#status' do
    it 'confirms when it has landed' do
      subject.land
      expect(subject.landed?).to eq true
    end
    it 'confirms when it has not yet landed' do
      subject.take_off
      expect(subject.landed?).to eq false
    end
  end

end
