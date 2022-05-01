require 'plane'

describe Plane do
  let(:airport) { double('airport') }

  describe '#initialization' do
    it { expect(subject).to be_an_instance_of Plane }
  end

  describe '#landing at airport' do
    it 'changes the flying status to false' do
      airport2 = Airport.new
      airport2.sunny = true
      airport2.land(subject)
      expect(subject.flying).to be false
    end
  end

end
