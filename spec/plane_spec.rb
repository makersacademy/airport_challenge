require 'plane.rb'

describe Plane do

  it {is_expected.to respond_to(:land).with(1).argument}

  it "landing is confirmed by the airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes).to include (subject)
  end

  it {is_expected.to respond_to(:take_off).with(1).argument}

  it "taking off is confirmed at the airport" do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(airport.planes).to eq []
  end

  it "can not take off when the weather is stormy" do
    airport = Airport.new
    subject.land(airport)
    airport.weather_is_stormy = true
    expect{subject.take_off(airport)}.to raise_error "Plane can not take off due to stormy weather"
  end

  it "can not land when the weather is stormy" do
    airport = Airport.new
    airport.weather_is_stormy = true
    expect{subject.land(airport)}.to raise_error "Plane can not land due to stormy weather"
  end

  it "More than one plane can land at the airport" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.land(airport)).to eq airport.planes
  end

  it "can not land when the airport is full" do
    airport = Airport.new
    expect{11.times{subject.land(airport)}}.to raise_error "Plane can not land because the airport is full"
  end


end
