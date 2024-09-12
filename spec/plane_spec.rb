require 'plane'

describe Plane do
  describe '#state' do
    it 'can only be flying or landed' do
      expect(subject.state).to eq :flying || :landed
    end
  end

  describe '#change_state' do
    it 'changes the state of the plane' do
      subject.change_state(:landed)
      expect(subject.state).to eq :landed
    end
  end
end
