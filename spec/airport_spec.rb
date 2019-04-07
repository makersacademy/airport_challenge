require 'airport'

describe Airport do

  it 'takes an argument for setting capacity number' do
    expect(initialize(10)).to eq @capacity
  end

  describe '#land' do
    it 'raises an error if the airport is full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
      expect { subject.land(plane) }.to raise_error("Unable to land plane as the airport is full.")
    end
    it 'raises an error a plane is already landed' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Unable to land plane as it is already landed.")
    end
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'stores a plane at the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'confirms plane is no longer in airport' do
      plane = Plane.new
      allow(subject).to receive(:forecast) { :sunny }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.empty?).to eq true
    end
    it 'raises an error if the airport is empty' do
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error("Unable to take off as the airport is empty.")
    end
  end

end
