require 'plane'

describe Plane do

  it { is_expected.to respond_to(:airborne) }
  it { is_expected.to respond_to(:airborne?) }
  it { is_expected.to respond_to(:up) }
  it { is_expected.to respond_to(:down) }

  let(:airport) {double(:airport)}
  describe '#airborne' do
    it 'confirms when it has landed' do
      subject.down
      expect(subject.airborne?).to eq false
    end
    it 'confirms when it has not yet landed' do
      subject.up
      expect(subject.airborne?).to eq true
    end
  end

end
