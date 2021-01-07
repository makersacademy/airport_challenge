require 'simplecov'
require 'airport'

describe Airport do
  describe '#land' do
    it 'can land a plane' do
      airport = Airport.new
      
      expect(airport).to respond_to(:land).with(1).argument
    end
  end
  describe '#take_off' do
    it 'allows a plane to take off from the airport' do
      airport = Airport.new
    
    expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end