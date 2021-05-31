require './lib/airport.rb'
describe Airport do
    subject(:airport) { described_class.new(20) }
    
   it 'instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument 
   end

   it 'instructs plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument 
   end

   it 'prevent landing if airport is full' do
   20.times do 
    airport.land(:plane)
   end
   expect { airport.land(:plane) }.to raise_error "Airport full"
end
end