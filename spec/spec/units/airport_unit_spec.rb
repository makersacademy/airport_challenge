require 'airport.rb'

RSpec.describe Airport do 
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane } 
 
  context 'Land' do 
    it 'Airport responds to land method' do 
      airport = Airport.new(20)
      expect(airport).to respond_to(:land).with(1).argument
    end 

    it 'does not allow landing when full' do 
      plane = double(:plane)
      20.times do 
        airport.land(plane)
      end 
      expect { airport.land(plane) }.to raise_error 'cannot land plane airport full'
    end 
  end 

  context '#take off' do 
    it 'Airport responds to take_off method' do 
      airport = Airport.new(20)
      expect(airport).to respond_to(:take_off).with(1).argument
    end 
  end 
end 
