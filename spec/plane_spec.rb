require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  context "#land" do
    it 'changes status for landed planes' do
      expect(subject.landing).to be_falsy
    end

    it 'raise error if landed plane want to land again' do
      subject.landing
      expect { subject.landing }. to raise_error "This plane has already landed"
    end
  end

  context "#flying" do
    it 'changes status for flying plane' do
      subject.landing
      expect(subject.flying).to be_truthy
    end
  end

end
