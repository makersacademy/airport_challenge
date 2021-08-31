require './lib/airport.rb'
require './lib/weather.rb' 


describe Airport do 
  it 'can create an instance of airport' do
  airport = Airport.new 
  expect(airport).to be_kind_of(Airport)
  end 
 
it 'can respond to num_of_planes' do 
  airport = Airport.new 
  expect(airport).to respond_to(:num_of_planes)
end 

it 'should show zero num_of_planes initally' do 
  airport = Airport.new 
  expect(airport.num_of_planes).to eq(0)
end 

it 'should respond to land' do 
  airport = Airport.new
  expect(airport).to respond_to(:land).with(1).argument
end 

it 'should update the num_of_planes when land is called' do 
  airport = Airport.new
  airport.land(1)
  expect(airport.num_of_planes).to eq(1)
end 

it 'should respond to take_off' do 
  airport = Airport.new
  expect(airport).to respond_to(:take_off).with(1).argument
end 

it 'should update the num_of_planes when take_off is called' do 
  airport = Airport.new 
  airport.land(1)
  airport.take_off(1)
  expect(airport.num_of_planes).to eq(0)
end 

it 'should confirm that a plane is no longer in the aiport when take_off is called' do
  airport = Airport.new 
  airport.land(1)
  airport.take_off(1)
  expect { airport.take_off(1) }.to output('A plane has left the airport').to_stdout
end

it 'should raise an error if the airport is full' do 
  airport = Airport.new 
  airport.land(100)
  expect { airport.land(100) }.to raise_error('The airport is full')
end 

it 'should have a default capacity that can be overidden' do
airport = Airport.new(50)
expect(airport.num_of_planes).to eq(50)
end 

it 'can respond to the weather class' do 
  airport = Airport.new 
  expect(airport).to respond_to(:forecast)
end

it 'should prevent planes from taking off if the forecast is stormy' do 
  airport = Airport.new
  allow(airport).to receive(:forecast).and_return("stormy") 
  expect { airport.take_off(1) }.to raise_error('NO FLYING: STORMY WEATHER')
end 

it 'should prevent planes from landing if the forecast is stormy' do 
  airport = Airport.new 
  allow(airport).to receive(:forecast).and_return("stormy")
  expect { airport.land(1) }.to raise_error('NO FLYING: STORMY WEATHER')
end 
  

end 
