require "airport"

describe Airport do
  it "can land an airplane" do
    airplane = "airplane"
    subject.land(airplane)
    expect(subject.get_airplanes).to eq([airplane])
  end

  it "an airplane can take-off" do
    airplane = "airplane"
    subject.land(airplane)
    subject.take_off(airplane)
    expect(subject.get_airplanes).to eq([])
  end

  it "not possible to land airplane when full" do
    airplane = "airplane"
    subject.land(airplane)
    airplane_two = "airplane_two"
    subject.land(airplane_two)
    expect(subject.get_airplanes).to eq([airplane])
  end
end