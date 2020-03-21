require 'airport'

describe Airport do

  let(:boeing) { Plane.new }

  context '#land' do
    it 'responds' do
      expect(subject).to respond_to :land
    end
    it 'expects one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'returns a Plane object' do
      expect(subject.land(boeing)).to be_instance_of(Plane)
    end
    it 'returns the same Plane object that was passed in' do
      expect(subject.land(boeing)).to be boeing
    end
  end

  context '#take_off' do
    it 'responds' do
      expect(subject).to respond_to :take_off
    end
  end
end
