require './lib/airport.rb'


describe airport do
    
    it 'contains a plane' do
      # arrange, act, assert
      airport = Airport.new
      expect(airport).to respond_to(plane)
    end
     
end 