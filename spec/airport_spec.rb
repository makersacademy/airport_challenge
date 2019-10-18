require "airport"
require "weather"

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  it "successfully instantiates the airport class" do
    expect(airport).to be_instance_of(Airport)
  end

  it "a plane can land at the airport" do
    allow(airport).to receive(:good_weather?).and_return(true)
    expect(plane).to receive(:land)
    airport.instruct_landing(plane)
  end

  it "a plane can take off from the airport" do
    allow(airport).to receive(:good_weather?).and_return(true)
    expect(plane).to receive(:take_off)
    airport.instruct_take_off(plane)
  end

  it "confirms the airport is empty when there are no planes landed" do
    allow(airport).to receive(:good_weather?).and_return(true)
    expect(plane).to receive(:take_off)
    airport.instruct_take_off(plane)
    expect(airport.hangar).to be_empty
  end

  it "if the hangar is full a plane cannot land and receives a message" do
    allow(airport).to receive(:good_weather?).and_return(true)
    allow(plane).to receive(:land)
    expect { 21.times { airport.instruct_landing(plane) } }.to raise_error(RuntimeError, "Hangar capacity at maximum, please continue to circle")
  end

  it "allows the user to change the hangar capacity for a different airport" do
    test_capacity = rand(1..100)
    test_airport = Airport.new(test_capacity)
    expect(test_airport.capacity).to eq (test_capacity)
  end

  it "if the weather is stormy, a plane cannot take-off" do
    allow(airport).to receive(:good_weather?).and_return(false)
    expect { airport.instruct_take_off(plane) }.to raise_error("Storms persist, take-off is delayed")
  end

  it "if the weather is stormy, a plane cannot land" do
    allow(airport).to receive(:good_weather?).and_return(false)
    expect { airport.instruct_landing(plane) }.to raise_error("Storms persist, please continue to circle")
  end
end
