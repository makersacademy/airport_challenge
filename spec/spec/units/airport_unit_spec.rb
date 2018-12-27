require 'airport.rb'

RSpec.describe Airport do 
  subject(:airport) {described_class.new(20)}
  context '#Airport' do 

    it 'looks for one argument' do 
      airport = Airport.new(20)
      expect(airport).to respond_to(:land).with(1).argument
    end 

    it 'looks for one argument' do 
      airport = Airport.new(20)
      expect(airport).to respond_to(:take_off).with(1).argument
    end 

    it'does not allow landing when at capacity' do 
      plane = double(:plane)
      20.times do 
        airport.land(plane)
      end 
      expect {airport.land(plane)}.to raise_error 'cannot land plane airport full'
    end 

  end 
end 