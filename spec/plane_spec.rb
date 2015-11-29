require "plane"

describe Plane do
let (:airport) { double :airport, take_off: subject, land: subject }

  it { is_expected.to respond_to :flying!}


  it "Is not flying by default" do
    expect(subject.flying?).to eq false
  end

  it "Is not flying when it lands" do
    airport.land(subject)
    expect(subject.flying?).to eq false
  end

  it "Makes flying true when flying." do
    subject.flying!
    expect(subject.flying?).to eq true
  end

  it "Is flying when it takes off" do
    airport.take_off(subject)
    expect(subject.flying?).to eq true
  end


end
