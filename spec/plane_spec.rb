require 'plane'

describe Plane do

  describe '#flying?' do
    it 'returns false if plane has landed' do
      subject.landed
      expect(subject.flying?).to eq false
    end

    it 'returns true if plane has taken off' do
      subject.taken_off
      expect(subject.flying?).to eq true
    end

  end

end
