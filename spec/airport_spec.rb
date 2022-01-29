require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    it 'instructs a plane to land at an airport' do
      expect(subject).to respond_to(:land_plane).with(1).argument      
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
  end
end

=begin 

  it 'prevents a plane landing when the airport is full' do
    plane = Plane.new
    expect{subject.land_plane(plane)}.to raise_error("Airport is full!") if subject.size == DEFAULT_CAPACITY
  end

  it 'allows default airport capacity to be overridden as appropriate' do
    new_capacity = capacity.rand(1000)
    expect(subject.capacity).to eq new_capacity
  end

  it 'prevents landing when weather is stormy' do
    expect{subject.land(plane)}.to raise_error("We can't land in stormy weather!") if subject.weather == 'stormy'
  end
end
=end
