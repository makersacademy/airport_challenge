require 'airport'

# My main source of 'wet' code is down to the fact that I am repeatedly having to switch
# the weather between being stormy or not stormy. Can I set it at more of a root level
# to reduce this? Is there another solution or is this just how testing goes?

describe Airport do

  it 'allows setting of a default capacity when instantiating an airport instance' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'instructs a plane to land at airport and confirms it has landed' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq("Plane #{plane} has landed.")
    end
    it 'raises an error when we try to land a plane at an airport already at capacity' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times {subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Plane cannot land. Airport full.")
    end
    it 'cannot land a plane which has already landed' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error("Plane already landed!")
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off from airport and confirms it is in the air' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq ("Plane #{plane} has left the airport and is in the air.")
    end
    it 'plane which is flying cannot take off' do
      expect{subject.take_off(Plane.new)}.to raise_error("Plane already flying!")
    end
    it 'planes can only take off from airports they are in' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect{Airport.new.take_off(plane)}.to raise_error("Plane not in that airport!")
    end
  end

  context 'when stormy' do
    describe '#take_off' do
      it 'prevents take off when weather is stormy' do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("Abort take off. Stormy weather.")
      end
      it 'prevents landing if weather is stormy' do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.land(Plane.new)}.to raise_error("Abort landing. Stormy weather.")
      end
    end
  end

end

#Reduntant tests (kept for reference):
#it { is_expected.to respond_to(:land).with(1).argument }
