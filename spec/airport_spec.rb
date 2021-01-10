require 'airport'
require 'plane'
require 'weather'

describe Airport do

  context 'when not stormy' do

    before(:each) do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'should respond to land' do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'reports plane in hangar' do
      plane = Plane.new
      expect(subject.land(plane)).to include plane
    end

    it 'should repond to take_off' do
      expect(Airport.new).to respond_to(:take_off).with(1).argument
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    # it 'has a variable capacity' do
    #   airport = Airport.new(50)
    #   50.times { airport.land(Plane.new) }
    #   expect { airport.land(Plane.new) }.to raise_error 'Airport is full'
    # end

    it 'raises an error when the airport is full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end
  end

  context 'when stormy' do

    before(:each) do
      allow(subject).to receive(:stormy?).and_return true
    end

    it 'raises an error when the weather is stromy' do
      expect { Airport.new.land(Plane.new) }.to raise_error 'Plane cannot land due to stormy weather'
    end

    it 'raises an error when the weather is stromy' do
      expect { Airport.new.take_off(Plane.new) }.to raise_error 'Plane cannot take off due to stormy weather'
    end
  end

  context 'edge case' do

    it 'raises an error as flying' do
      allow(subject).to receive(:flying?).and_return true
      expect { Airport.new.take_off(Plane.new) }.to raise_error 'Plane is already flying'
    end

  end

end
