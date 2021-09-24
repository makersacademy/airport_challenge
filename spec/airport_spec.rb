# Task https://github.com/pchan2/airport_challenge
require 'airport'

describe Airport do
  it "instructs a plane to land at the airport" do
    plane = Plane.new
    expect(subject.land plane).to eq [plane]
  end

  it "instructs a plane to take off from the airport" do
    expect(subject.take_off).to eq "take off"
  end

  it "confirms a plane is no longer at the airport" do
    expect(subject.not_at_airport?).to eq true
  end

  it "prevents landing when airport is full" do
    Airport::DEFAULT_CAPACITY.times do
      subject.land Plane.new
    end
    expect { subject.land Plane.new }.to raise_error "Airport full"
  end
end
