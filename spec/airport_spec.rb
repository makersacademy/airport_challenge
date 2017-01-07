require 'airport'

describe Airport do

  describe '#ask_to_land' do
    it 'Asks a plane to land' do
      should respond_to(:ask_to_land).with(1).argument
    end
    it 'Gets a specified plane to land' do
      plane = Plane.new
      airport = Airport.new(weather: 'fine')
      expect(airport.ask_to_land).to eq(plane)
    end
    it 'Prevents landing when weather is stormy' do
      airport = Airport.new(weather: 'stormy')
      expect {airport.ask_to_land(Plane.new)}.to raise_error("Unable to land due \
      to stormy weather")
    end
    it 'Prevents landing when airport is full' do
      airport = Airport.new(weather: 'fine')
      airport.capacity.times(airport.ask_to_land(Plane.new))
      expect {airport.ask_to_land(Plane.new)}.to raise_error("Unable to land \
      due to airport being full")
    end
  end

  describe '#has_landed?'
    it 'Confirms a specified plane has landed' do
      plane = Plane.new
      airport = Airport.new(weather: 'fine')
      airport.ask_to_land(plane)
      expect(airport.has_landed?(plane)).to eq(plane)
    end
  end

  describe '#ask_to_take_off' do
    it 'Asks a plane to take off' do
      should respond_to(:ask_to_take_off).with(1).argument
    end
    it 'Gets a specified plane to take off' do
      plane = Plane.new
      airport = Airport.new(weather: 'fine')
      expect(subject.ask_to_take_off(plane)).to eq(true)
    end
    it 'Prevents take off when weather is stormy' do
      plane = Plane.new
      airport = Airport.new(weather: 'stormy')
      expect {airport.ask_to_take_off(plane)}.to raise_error("Unable to take \
      off due to stormy weather")
    end
  end

  describe '#has_taken_off?'
    it 'Confirms a specified plane has taken off' do
      plane = Plane.new
      airport = Airport.new(weather: 'fine')
      airport.ask_to_take_off(plane)
      expect(airport.has_taken_off?(plane)).to eq(true)
    end
  end

  describe '#intialize' do
    it 'Create airport with specified capacity' do
      airport = Airport.new(capacity: 10)
      expect(airport.capacity).to eq 10
    end
  end
end
