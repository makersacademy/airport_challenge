require 'airport'

describe Airport do

  it 'allows setting of a default capacity when instantiating an airport instance' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'instructs a plane to land at airport and confirms it has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq("Plane #{plane} has landed.")
    end
    it 'raises an error when we try to land a plane at an airport already at capacity' do
      subject.capacity.times {subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Plane cannot land. Airport full.")
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off from airport and confirms it is in the air' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq ("Plane #{plane} is in the air.")
    end
  end

  context 'when stormy' do
    describe '#take_off' do
      it 'prevents take off when weather is stormy' do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(Plane.new)}.to raise_error("Abort take off. Stormy weather.")
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
