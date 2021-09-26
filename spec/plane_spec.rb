require 'plane'

describe Plane do
  let(:airport) { double(:airport) }

  before do
    allow(airport).to receive(:landed_planes).and_return([])
    allow(airport).to receive(:capacity).and_return(1)
    allow(airport).to receive(:weather).and_return(:sunny)
  end

  it "plane lands at an airport when instructed" do
    subject.take_off(airport)
    subject.land(airport)
    expect(subject.current_airport).to eq airport
  end

  it 'plane takes off from airport and confirms it is no longer in airport' do
    subject.take_off(airport)
    expect(subject.in_flight).to eq true
    expect(subject.current_airport).to eq nil
  end

  it "prevents landing when the airport is full" do
    full_airport = double("full_airport", :landed_planes => [1], :capacity => 1)
    expect { subject.land(full_airport) }.to raise_error
  end

  it "prevents takeoff and landing when the weather is stormy" do
    stormy_airport = double("stormy_airport", :landed_planes => [subject])
    allow(stormy_airport).to receive(:weather).and_return(:stormy)
    expect { subject.take_off(stormy_airport) }.to raise_error
    expect { subject.land(stormy_airport) }.to raise_error
  end

  it "prevents takeoff when plane is already in the air" do
    subject.take_off(airport)
    expect { subject.take_off }.to raise_error
  end

  it "prevents landing when the plane is already grounded" do
    expect { subject.land }.to raise_error
  end
end
