require './lib/airport'
require './lib/plane'
require './lib/weather'

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

context 'Airport arrivals capacity' do
  it "takes the DEFAULT_CAPACITY" do
    default_airport = Airport.new
    expect(default_airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
  it "allows user to change capactity" do
    airport3= Airport.new(3)
    airport3.capacity
    expect(airport3.capacity).to eq(3)
  end
end

  # context 'Weather is stormy'do
  #   it "confirms planes can't land in storm" do
  #
  #   airport=Airport.new
  #   airport.double(:weather, => 3)
  #   expect(airport.land(plane)).to output("Sorry it's too stormy to and right now")
  # end
# allow_any_instance_of(Widget).to receive(:name).and_return("Wibble")
end
