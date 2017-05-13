require 'plane.rb'

describe Plane do

  it {is_expected.to respond_to(:land).with(1).argument}

  it "Plane landing is confirmed by the airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.plane).to eq (subject)
  end

  it {is_expected.to respond_to(:take_off).with(1).argument}

  it "Plane taking off is confirmed at the airport" do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(airport.plane).to eq nil
  end

  it "Plane does not take off when the weather is stormy" do
    airport = Airport.new
    subject.land(airport)
    airport.weather_is_stormy = true
    expect{subject.take_off(airport)}.to raise_error "Flight is cancelled due to stormy weather"
  end
end
