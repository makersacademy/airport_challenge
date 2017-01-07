# unit tests for plane

require 'plane.rb'
require 'airport.rb'

describe Plane do
  #responds to land
  it 'responds to land method' do
    expect(subject.respond_to?(:land)).to eq true
  end

  #when told to land, actually does
  it 'actually lands' do
    the_airport = Airport.new
    subject.land(the_airport)
    expect(the_airport.plane).to eq(subject)
  end
  #can correctly confirm land
  it 'confirms landing correctly when true' do
    the_airport = Airport.new
    subject.land(the_airport)
    expect(subject.confirm_landing(the_airport)).to eq true
  end
  #can correctly not confirm land
  it 'confirms landing correctly when false' do
    the_airport = Airport.new
    expect(subject.confirm_landing(the_airport)).to eq false
  end

  it 'can respond to takeoff' do
    expect(subject.respond_to?(:takeoff)).to eq true
  end

  it 'actually takes off' do
    airport = Airport.new
    subject.land(airport)
    subject.takeoff(airport)
    expect(subject.airport).not_to eq(airport)
  end

  it "correctly confirms takeoff" do
    airport = Airport.new
    subject.land(airport)
    subject.takeoff(airport)
    expect(subject.confirm_takeoff(airport)).to eq true
  end

  it "correctly does not confirm takeoff" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.confirm_takeoff(airport)).to eq false
  end
end
