require 'plane'

describe Plane do
  let(:airport) {Airport.new}
  let(:plane1) {Plane.new}
  let(:plane2) {Plane.new}

  it "responds to call to #land from Air Traffic Controller" do
    expect(subject).to respond_to(:land)
  end
  it "Responds to call to #take_off from Air Traffic Controller" do
    expect(subject).to respond_to(:take_off)
  end
  it "Confirms take_off with a message" do
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    airport.request_landing(subject)
    expect{airport.request_take_off(subject)}.to output("Flying free!\n").to_stdout
  end
  it "confirms contains a variable that outputs flight status" do
    airport.request_landing(plane1)
    expect(plane2.airborne).to eq(true)
    expect(plane1.airborne).to eq(false)
  end
end
