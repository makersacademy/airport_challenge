require 'airport'
require 'plane'
require 'weather'

describe Plane do
    
  it { is_expected.to respond_to :land_at_airport }

  it { is_expected.to respond_to :take_off_from_airport }

  it 'confirms the plane is no longer in the airport once the plane takes off' do
    airport = Airport.new
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


end 