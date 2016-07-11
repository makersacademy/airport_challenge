require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  it 'allows setting default capacity when instantiating airport instance' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  context 'clear weather' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end

    describe '#land' do
      it 'instructs a plane to land at airport and confirms it has landed' do
        expect(subject.land(plane)).to eq("Plane #{plane} has landed.")
      end
      it 'cannot land a plane at a full capacity airport' do
        subject.capacity.times {subject.land(Plane.new)}
        expect{subject.land(Plane.new)}.to raise_error("Error. Airport full.")
      end
      it 'cannot land a plane which has already landed' do
        subject.land(plane)
        expect{subject.land(plane)}.to raise_error("Plane already landed!")
      end
      it 'remembers landed planes' do
        subject.land(plane)
        expect(subject.hangar).to include plane
      end
    end

    describe '#take_off' do
      it 'instructs plane to take off from airport, confirms is in the air' do
        subject.land(plane)
        expect(subject.take_off(plane)).to eq ("Plane #{plane} has left the airport and is in the air.")
      end
      it 'plane which is flying cannot take off' do
        expect{subject.take_off(plane)}.to raise_error("Plane already flying!")
      end
      it 'planes can only take off from airports they are in' do
        subject.land(plane)
        expect{Airport.new.take_off(plane)}.to raise_error("Plane not in that airport!")
      end
      it 'remembers planes which have taken off from an airport' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.hangar).not_to include plane
      end
    end

  end

  context 'stormy weather' do
    describe '#take_off' do
      it 'prevents take off if weather is stormy' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("Abort. Stormy weather.")
      end
      it 'prevents landing if weather is stormy' do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.land(plane)}.to raise_error("Abort. Stormy weather.")
      end
    end
  end

end
