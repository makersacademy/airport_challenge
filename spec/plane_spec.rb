require "plane"

describe Plane do


  it { is_expected.to respond_to :flying!}


  it "Is not flying by default" do
    expect(subject.flying?).to eq false
  end

  it "Is not flying when it lands" do
    airport = Airport.new
    airport.land(subject)
    expect(subject.flying?).to eq false
  end

  it "Makes flying true when flying." do
    subject.flying!
    expect(subject.flying?).to eq true
  end

  it "Is flying after it takes off" do
    airport = Airport.new
    airport.land(subject)
    airport.take_off(subject)
    expect(subject.flying?).to eq true
  end


end
