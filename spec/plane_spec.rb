require 'airport'
require 'plane'
require 'weather'

describe Plane do
    
  it { is_expected.to respond_to :land_at_airport }

  it { is_expected.to respond_to :take_off_from_airport }

  it 'confirms the plane is no longer in the airport once the plane takes off' do
    airport = Airport.new
    allow(airport).to receive(:local_weather) { "Sunny" }
    subject.land_at_airport(airport)
    subject.take_off_from_airport(airport)
    subject.in_airport?
    expect(subject).not_to be_in_airport
  end 

  it 'raises error if it tries to land when airport is full' do
    airport = Airport.new
    allow(airport).to receive(:local_weather) { "Sunny" }
    # method stubb to force sunny weather
    airport.capacity.times do
      Plane.new.land_at_airport(airport)
    end
    expect { Plane.new.land_at_airport(airport) }.to raise_error "The airport is full"
  end 

  it 'raises error if it tries to land when weather is stormy' do
    airport = Airport.new
    allow(airport).to receive(:local_weather) { "Stormy" }
    expect { subject.land_at_airport(airport) }.to raise_error "It's too stormy to land"
  end 

  it 'can land at the airport if the weather is sunny' do
    airport = Airport.new
    allow(airport).to receive(:local_weather) { "Sunny" }
    subject.land_at_airport(airport)
    expect(airport.parked_planes).to eq [subject]
  end 

  it 'raises an error if trying to take off from an airport it is not parked at' do
    airport = Airport.new
    allow(airport).to receive(:local_weather) { "Sunny" }
    expect { subject.take_off_from_airport(airport) }.to raise_error "The plane is not parked in that airport" 
  end 

  it 'can land and take off multiple planes' do
    airport = Airport.new
    allow(airport).to receive(:local_weather) { "Sunny" }
    plane1, plane2, plane3 = Plane.new, Plane.new, Plane.new
    plane1.land_at_airport(airport)
    plane2.land_at_airport(airport)
    plane3.land_at_airport(airport)
    plane1.take_off_from_airport(airport)
    plane3.take_off_from_airport(airport)
    expect(airport.parked_planes).to eq [plane2]
  end 

end 
