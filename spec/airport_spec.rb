
require './lib/airport.rb'

describe Airport do

  let (:plane) { double :plane }
  let (:weather) { double :weather }

  it "prevents landing when capacty reached" do
    plane = Plane.new
    allow(weather).to receive(:stormy?).and_return(false)
    subject.capacity.times { plane.land_at(subject, weather) }
    expect{ plane.land_at(subject, weather) }.to raise_error "Landing not permitted as airport is full"
  end

  it "capacity is 10 if set by user" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end
end
