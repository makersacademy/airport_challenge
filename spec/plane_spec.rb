require 'Plane'

describe Plane do
  describe '#landed?' do
    it 'should confirm that a plane has landed' do
      expect(subject.landed?).to eq true
    end
  end
end
