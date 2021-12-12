require 'airport'

describe Airport do

  describe '#new_capacity' do
    it 'check if airport capacity can be overriden' do
      expect(subject.new_capacity(8)).to eq 8
    end
  end

  describe '#land' do
    it 'lands a plane in an airport' do
      plane = Plane.new
      subject.weather_setter(2)
      expect(subject.land(plane)).to be(plane)
    end
  end

  describe '#take_off' do
    it 'plane takes off from airport' do
      plane = Plane.new
      subject.weather_setter(2)
      subject.land(plane)
      expect(subject.take_off(plane)).to be(plane)
    end
  end

  context 'when airport is full' do
    it 'to prevent landing' do
      subject.new_capacity(0)
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "Can't land, Airport is at full capacity"
    end
  end 

  context 'when airport is empty' do
    it 'prevent take_off' do
      subject.new_capacity(0)
      plane = Plane.new

      expect { ubject.take_off(plane) }.to raise_error "No planes in the airport"
    end
  end

  context 'when weather is stormy' do
    it 'prevents take_off' do
      subject.weather_setter(2)
      plane = Plane.new
      subject.land(plane)
      subject.weather_setter(1)

      expect { subject.take_off(plane) }.to raise_error "Can't take off, weather is stormy"
    end

    it 'prevents landing' do
      subject.weather_setter(1)
      plane = Plane.new
      
      expect { subject.land(plane) }.to raise_error "Can't land, weather is stormy"
    end

  end

end
