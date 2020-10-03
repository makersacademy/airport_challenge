require 'plane'

describe Plane do
  it "responds to call to #land from Air Traffic Controller" do
    expect(subject).to respond_to(:land)
  end
  it "Responds to call to #take_off from Air Traffic Controller" do
    expect(subject).to respond_to(:take_off)
  end
  it "Confirms take_off with a message" do
    airport = Airport.new
    plane = subject
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    airport.request_landing(plane)
    expect{airport.request_take_off(plane)}.to output("Flying free!\n").to_stdout
  end
end
