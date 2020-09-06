require 'plane.rb'
require 'airport.rb'

heathrow = Airport.new
paris = Airport.new

describe Plane do
  ## Taking off
  
  it 'Should respond to #land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Should set @location to the name of the airport landed at' do
    subject.land(heathrow)
    subject.location.should eq(heathrow)
  end

  #it 'Should not land if the airport is full' do

  #end



  ## Landing
  it 'Should respond to #take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'Should set @last_airport equal to where the plane left from' do
    subject.take_off(heathrow)
    subject.last_airport.should eq(heathrow)
  end

  it 'should set @location to "in the air" if takeoff is done succesfully' do
    subject.take_off(heathrow)
    subject.location.should eq("in the air")
  end

  it 'Should confirm that it is no longer in an airport after takeoff' do
    expect(subject).to respond_to(:location?)
    expect(subject.location?).to eq "The plane is in the air."
  end

  it 'Should confirm the planes new location after takeoff' do
    expect(subject.take_off(heathrow)).to eq "The plane is in the air."
  end

end