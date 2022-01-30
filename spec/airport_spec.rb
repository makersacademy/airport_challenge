require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    it 'instructs a plane to land at an airport' do
      expect(subject).to respond_to(:land_plane).with(1).argument      
    end

    it 'prevents a plane landing when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }  
      expect { subject.land_plane(plane) }.to raise_error("Airport is full!")
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off from an airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'confirms that a plane is no longer in the airport after take off' do
      expect { subject.take_off(plane) }.to raise_error("That plane has left the airport!")
    end
  end

  describe '#weather' do
    it 'checks the current weather conditions' do
      expect(subject).to respond_to(:weather)
    end 

    it 'prevents take off when the weather is stormy' do
      expect { subject.take_off(plane) }.to raise_error("We can't take off in stormy weather!") if subject.weather == 'stormy' 
    end

    it 'prevents landing when weather is stormy' do
      expect { subject.land(plane) }.to raise_error("We can't land in stormy weather!") if subject.weather == 'stormy'
    end
  end

  describe '#hangar' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY 
    end

    it 'allows default airport capacity to be overridden as appropriate' do
      new_capacity = Airport.new(50)
      expect { new_capacity.size != Airport::DEFAULT_CAPACITY }
    end
  end
end
