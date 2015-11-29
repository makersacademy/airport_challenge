require "plane"

describe Plane do
let (:airport) { double :airport, land: subject, take_off: subject }

  it { is_expected.to respond_to :flying!}


  it "Is not flying by default" do
    expect(subject.flying?).to eq false
  end

  it "Is not flying when it lands" do
    airport.land(subject)
    expect(subject.flying?).to eq false
  end

  it "Is flying when it takes off" do
    airport.take_off(subject)
    expect(subject.flying?).to eq true
  end


end
