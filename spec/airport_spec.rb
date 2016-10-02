require './lib/airport'
require './lib/plane'

describe "Airport" do
  airport = Airport.new
  plane = Plane.new

 it 'creates an instance of aiport'do
  expect(airport.class).to eq Airport
 end

 context 'plane is airborne' do
   it "changes plane flight status to 'flying'"do
    airport.departures(plane)
    airport.take_off
     expect(plane.status).to eq('flying')
   end
 end

it 'lands a plane' do
  expect(airport).to respond_to(:land).with(1).argument
end

it 'confirms plane has landed' do
  expect{airport.land(plane)}.to output("Plane has landed").to_stdout
end

context 'Airport is full' do
  it "won't let planes land if arrivals is full" do

     10.times {airport.land(Plane.new)}

    expect{airport.land(Plane.new)}.to output("Sorry, the airport is full").to_stdout
  end
end





end
