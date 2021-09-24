# Task https://github.com/pchan2/airport_challenge
require 'airport'

describe Airport do
  it "instructs a plane to land at an airport" do
    expect(subject.land).to eq "land plane"
  end

  it "instructs a plane to take off from the airport" do
    expect(subject.take_off).to eq "take off"
  end

  it "confirms a plane is no longer at the airport" do
    expect(subject.not_at_airport?).to eq true
  end
end
