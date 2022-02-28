require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }
  let(:good_weather) { double(:good_weather, :stormy? => false) }
  let(:bad_weather) { double(:bad_weather, :stormy? => true) }
  
  it 'should respond to land' do
    expect(subject).to respond_to(:land)
  end

  it 'should allow the air traffic controller to specify a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'should allow specific planes to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'should ensure a plane is no longer at the airport when taking off' do
    subject.land(plane)
    subject.take_off(plane)
    # the plane should've landed and taken off, so trying to take off another plane should not work.
    expect { subject.take_off(plane) }.to raise_error 'Airport is empty'
  end

  it 'should have a default capacity' do
    # assuming a default capacity of 20
    expect(subject.capacity).to eq 20
  end

  it 'should have a default capacity that can be overwritten' do
    airport = Airport.new(50, good_weather)
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Airport is full'
  end

  context 'Weather dependant tests' do

    it 'should not land in bad weather' do 
      airport = Airport.new(10, bad_weather)
      expect { airport.land(plane) }.to raise_error 'Weather too stormy to land'
    end

    it 'should not take off in bad weather' do
      airport = Airport.new(10, bad_weather)
      airport.planes << plane # manually adding a plane to the airport, as bad weather prevents landing a plane
      expect { airport.take_off(plane) }.to raise_error 'Weather too stormy to take off'
    end

  end

end