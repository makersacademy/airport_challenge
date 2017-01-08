require 'airport'

describe Airport do

  describe '#ask_to_land' do
    it 'Get a specified plane to land' do
      plane = Plane.new
      airport = Airport.new('sunny')
      expect(airport.ask_to_land(plane)).to end_with([plane])
    end
    it 'Prevent landing when weather is stormy' do
      airport = Airport.new('stormy')
      expect {airport.ask_to_land(Plane.new)}.to raise_error("Unable to land due to stormy weather")
    end
    it 'Prevent landing when airport is full' do
      airport = Airport.new('sunny')
      airport.capacity.times { airport.ask_to_land(Plane.new) }
      expect {airport.ask_to_land(Plane.new)}.to raise_error("Unable to land due to airport being full")
    end
  end

  describe '#has_landed?' do
    it 'Confirm a specified plane has landed' do
      plane = Plane.new
      airport = Airport.new('sunny')
      airport.ask_to_land(plane)
      expect(airport.has_landed?(plane)).to eq(true)
    end
  end

  describe '#ask_to_take_off' do
    it 'Get a specified plane to take off' do
      plane = Plane.new
      airport = Airport.new('sunny')
      expect(airport.ask_to_take_off(plane)).to eq(nil)
    end
    it 'Prevents take off when weather is stormy' do
      plane = Plane.new
      airport = Airport.new('stormy')
      expect {airport.ask_to_take_off(plane)}.to raise_error("Unable to take off due to stormy weather")
    end
  end

  describe '#has_taken_off?' do
    it 'Confirm a specified plane has taken off' do
      plane = Plane.new
      airport = Airport.new('sunny')
      airport.ask_to_take_off(plane)
      expect(airport.has_taken_off?(plane)).to eq(true)
    end
  end

  describe '#intialize' do
    it 'Create airport with specified capacity' do
      airport = Airport.new('sunny', 10)
      expect(airport.capacity).to eq 10
    end
  end
end
