require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
  let(:stormy_airport) { double(:stormy_airport) }

  before do
    allow(airport).to receive(:landed_planes).and_return([])
    allow(airport).to receive(:capacity).and_return(1)
    allow(airport).to receive(:stormy_weather).and_return(false)
    allow(stormy_airport).to receive(:stormy_weather).and_return(true)
    allow(stormy_airport).to receive(:landed_planes).and_return([])
    allow(stormy_airport).to receive(:capacity).and_return(10)
  end

  it "plane lands at an airport when instructed" do
    subject.current_airport = airport
    subject.take_off(airport)
    subject.land(airport)
    
    expect(subject.current_airport).to eq airport
  end

  it 'plane is able to take off from airport' do
    subject.current_airport = airport
    subject.take_off(airport)

    expect(subject.in_flight).to eq true
  end

  it 'plane is no longer in the airport once taken off' do
    subject.current_airport = airport
    subject.take_off(airport)
    
    expect(subject.current_airport).to eq nil
  end

  it "prevents landing when the airport is full" do
    full_airport = double("full_airport", :landed_planes => [1], :capacity => 1)
    message = "This airport is full"

    expect { subject.land(full_airport) }.to raise_error message
  end

  it "prevents takeoff when the weather is stormy" do
    message = "You cannot take off in stormy weather"
    expect { subject.take_off(stormy_airport) }.to raise_error message
  end

  it "prevents landing when the weather is stormy" do 
    message = "You cannot land in stormy weather"
    subject.current_airport = airport
    subject.take_off(airport)

    expect { subject.land(stormy_airport) }.to raise_error message
  end

  it "prevents takeoff when plane is already in the air" do
    message = "You are already in flight"
    subject.current_airport = airport
    subject.take_off(airport)

    expect { subject.take_off }.to raise_error message
  end

  it "prevents landing when the plane is already grounded" do
    message = "You are already landed"
    subject.current_airport = airport

    expect { subject.land(airport) }.to raise_error message
  end

  it "prevents take off from an airport you are not at" do
    message = "You cannot take off from an airport you are not at"
    second_airport = double("second_airport", :landed_planes => [], :capacity => 10, :stormy_weather => false)
    subject.current_airport = airport

    expect { subject.take_off(second_airport) }.to raise_error message
  end
end
