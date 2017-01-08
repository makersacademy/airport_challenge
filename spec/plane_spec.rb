require 'plane'

describe Plane do

  describe '#landed?' do
    it 'returns true if plane has landed' do
      expect(subject.landed?).to eq true
    end
  end

end
