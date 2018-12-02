require 'airport'
require 'plane'

describe Airport do 
  let(:airport) { described_class.new }    
  let(:plane) { Plane.new }

  it 'responds to #land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'receives a plane with #land' do
    expect(airport.land(plane)).to eql([plane])
  end

  it 'remembers a plane after #land' do
    airport.land(plane)
    airport.land(plane) 
    expect(airport.plane).to eql([plane, plane])
  end
      
  it 'responds to #take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'confirms a plane is no longer in airport' do
    allow(airport.take_off(plane)).to receive(airport.weather_reporter(3)).and_return("Sunny")
    expect(airport.take_off(plane)).to eql("The weather is sunny, safe to take off. Plane #{plane.object_id} has successfully left the airport")
  end

  it 'responds to #weather_reporter' do
    expect(airport).to respond_to(:weather_reporter)
  end

  it 'only allows take off in sunny weather' do
    allow(airport.take_off(plane)).to receive(airport.weather_reporter(1)).and_return("Stormy")
    expect(airport.take_off(plane)).to eql("The weather is too stormy, you cannot take_off")
  end

#  it "stops take_off if #weather_reporter == 'Stormy'" do
#  airport.weather(3)
#  expect(airport.take_off).to eql("It's too stormy to take off!")
#  end

end
