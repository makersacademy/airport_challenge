require 'spec_helper'
require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'plane is at airport when landing' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to eq([plane])
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }  

  it 'plane is no longer at the airport when it takes off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hanger).to eq([])
  end

  it 'traffic controller gets confirmation the plane is no longer there' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.take_off(plane) }.to output("#{plane} has left #{subject}").to_stdout
  end

  it 'airport takes argument capacity when initialized' do
    airport = Airport.new(4)
    expect(airport.capacity).to eq(4)
  end

  it 'raises error if you try and land plane at an airport at max capacity' do
    plane1 = Plane.new
    plane2 = Plane.new
    heathrow = Airport.new
    heathrow.land(plane1)
    expect { heathrow.land(plane2) }.to raise_error('Airport full cannot land') 
  end

  it 'airport capacity can be overridden' do
    heathrow = Airport.new
    heathrow.capacity = 20
    expect(heathrow.capacity).to eq(20)
  end

end
