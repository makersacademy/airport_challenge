require 'plane'

describe Plane do

  it { should respond_to(:in_hangar?) }

  it { should respond_to(:land) }

  it { should respond_to(:take_off) }

  describe '#land' do
    it 'should confirm that plane is in the hangar' do
      subject.land
      expect(subject).to be_in_hangar
    end
  end

  describe '#take off' do
    it 'should confirm that plane is not in the hangar' do
      subject.take_off
      expect(subject).to_not be_in_hangar
    end
  end

end
