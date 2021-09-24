require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
  it "plane lands at an airport when instructed" do
    allow(airport).to receive(:landed_planes).and_return([])
    allow(airport).to receive(:capacity).and_return(1)

    subject.land(airport)
    expect(subject.current_airport).to eq airport
  end
  it 'plane takes off from airport and confirms it is no longer in airport' do
    subject.take_off
    expect(subject.in_flight).to eq true
    expect(subject.current_airport).to eq nil
  end
  it "prevents landing when the airport is full" do
    full_airport = double("full_airport", :landed_planes => [1], :capacity => 1)
    expect { subject.land(full_airport) }.to raise_error
  end
end
