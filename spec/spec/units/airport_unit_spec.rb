require 'airport.rb'

RSpec.describe Airport do 
  context '#Airport' do 

    it 'looks for one argument' do 
      airport = Airport.new
      expect(airport).to respond_to(:land).with(1).argument
    end 

    it 'looks for one argument' do 
      airport = Airport.new
      expect(airport).to respond_to(:take_off).with(1).argument
    end 
  end 
end 