require 'plane'

describe Plane do

  it{is_expected.to respond_to(:flying?)}
  it { expect(subject.flying?).to be true }

  describe '#landed' do
    it 'can land at an airport' do
      expect(subject.landed).to eq false
    end
  end

  describe '#takeoff' do
    it 'can take off from an airport' do
      expect(subject.takeoff).to eq true
    end
  end
end
