require 'airport'
require 'plane'

describe Airport do

  before { allow(subject).to receive(:stormy?) { false } }

  # I want to instruct a plane to land at an airport
  it 'should be able to instruct the plane to #land ' do
    is_expected.to respond_to(:land).with(1).argument
  end

  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'should instruct the plane to #take_off and receive a respond' do
    subject.land "Boeing 777"
    message = "Elvis has left the bulding"
    expect { subject.take_off }.to output(message).to_stdout
  end
  
  # I want to prevent landing when the airport is full
  it 'should prevent #land if #full?' do
    plane = Plane.new
    message = "Airport is full"
    # subject.capacity.times { subject.land(plane) }
    subject.stub(:full?) { true }
    expect { subject.land(plane) }.to raise_error message
  end

  it 'should prevent #take_off if #empty?' do
    message = "No planes at the airport"
    expect { subject.take_off }.to raise_error message
  end

  # I would like a default airport capacity that can be overridden as appropriate
  it 'should change default capacity to 20 when its passed in' do
    expect(subject.capacity = 20).to eq 20
  end

  # I want to prevent takeoff when weather is stormy
  it 'should prevent take off if #stormy?' do
    message = "No flights allowd due storm"
    subject.stub(:stormy?) { true }
    expect { subject.take_off }.to raise_error message
  end

  # I want to prevent landing when weather is stormy 
  it 'should prevent landing if #stormy?' do
    subject.stub(:stormy?) { true }
    message = "No landing allowd due storm"
    expect { subject.land("Boeing 777") }.to raise_error message
  end

end
