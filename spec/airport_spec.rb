require "airport"

describe Airport do
  it "can land an airplane" do
    airplane = "airplane"
    subject.land(airplane)
    expect(subject.get_airplanes).to eq([airplane])
  end
end