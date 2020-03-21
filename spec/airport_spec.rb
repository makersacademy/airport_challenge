require 'airport'

describe Airport do

  let(:boeing) { Plane.new }
  let(:learjet) { Plane.new }

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
    it 'stores the landed plane in the hangar' do
      subject.land(boeing)
      expect(subject.hangar).to be boeing
    end
    it 'raises error if @hanger is occupied' do
      subject.land(boeing)
      expect { subject.land(learjet) }.to raise_error 'Hangar full.'
    end
  end

  context '#take_off' do
    it 'responds' do
      expect(subject).to respond_to :take_off
    end
    it 'expects one argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'returns a Plane object' do
      expect(subject.take_off(boeing)).to be_instance_of(Plane)
    end
    it 'returns the same Plane object that was passed in to confirm take off' do
      expect(subject.take_off(boeing)).to be boeing
    end
  end

end
