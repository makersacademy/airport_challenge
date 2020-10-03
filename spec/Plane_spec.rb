require "Plane"

describe Plane do
  let(:airport) { double(:airport) }
  let(:sky) { double(:sky) }
  it "can land at an airport and takeoff" do
    subject.land(airport)
    expect(subject.airport).to eq airport
    subject.takeoff
    expect(subject.airport).to eq nil
  end

  it "knows if it's flying" do
    subject.land(airport)
    expect(subject.flying?).to eq false
    subject.takeoff
    expect(subject.flying?).to eq true
  end
end
