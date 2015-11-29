require "plane"

describe Plane do
let (:airport) { double :airport, land: subject, take_off: subject }

  it { is_expected.to respond_to :landed?}


  it "Is Landed by default" do
    expect(subject.landed?).to eq true
  end

  it "Becomes 'landed' when it lands" do
    airport.land(subject)
    expect(subject.landed?).to eq true
  end

  it "Is 'flying' when it takes off" do
    airport.take_off(subject)
    expect(subject.flying?).to eq true
  end

  it "Can't be flying and Landed at the same time" do
    airport.land(subject)
    expect(subject.flying?).to eq false
  end


end
