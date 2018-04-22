require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#flying?' do
    it 'returns false if plane has landed' do
      subject.land
      expect(subject.flying?).to eq false
    end

    it 'returns true if plane has taken off' do
      subject.take_off
      expect(subject.flying?).to eq true
    end

  end

end
