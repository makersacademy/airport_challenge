require 'airport'

describe Airport do
  it "should check if plane has landed" do
    subject.land_plane(double(:plane))
    expect(subject.airport.length).to eq 1
  end

  it "should check if plane has departed and not in airport" do
    subject.land_plane(double(:plane))
    subject.take_off
    expect(subject.airport.empty?).to eq true
  end
end
