require 'airport'
describe Airport do

  it 'Can instruct a plane to land' do
    expect(subject).to respond_to(:tell_to_land)
  end
  
    describe '#tell_to_land' do
      it 'accepts a single plane' do
        plane = Planes.new
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        expect { subject.tell_to_land(plane) }.not_to raise_error
      end
      it 'raises an error if airport is full' do
        plane = Planes.new
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        subject.tell_to_land(plane)
        expect { subject.tell_to_land(plane) }.to raise_error RuntimeError, "Can't land; airport's full."
      end
      it 'raises an error if the weather is stormy' do
        plane = Planes.new
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        expect { subject.tell_to_land(plane) }.to raise_error RuntimeError, "Can't land; stormy weather."
      end
    end

  it 'Can instruct a plane to take off' do
    expect(subject).to respond_to(:tell_to_takeoff)
  end

    describe '#tell_to_takeoff' do
      it 'accepts a single plane' do 
        plane = Planes.new
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        expect { subject.tell_to_takeoff(plane) }.not_to raise_error
      end
      it 'raises an error if the weather is stormy' do
        plane = Planes.new
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        expect { subject.tell_to_takeoff(plane) }.to raise_error RuntimeError, "Can't take off; stormy weather."
      end
      it 'if takeoff successfull, confirms that the plane is no longer at the airport' do
        plane = Planes.new
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        expect(subject.tell_to_takeoff(plane)).to eq(0)
      end
    end

  it 'Has a default capacity of 1 which can be overwritten' do
    plane = Planes.new
    expect(Airport.new.instance_variable_get(:@capacity)).to eq(1)
    expect(Airport.new(3).instance_variable_get(:@capacity)).to eq(3)
  end

end
