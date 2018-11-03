require "airport.rb"

describe Airport do

  it "responds to .landing" do
    expect(subject).to respond_to(:landing)
  end

  it ".landing responds to 1 argument" do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  # it "lets a plane land at the airport" do
  #   plane = subject.landing(Plane.new)
  #   expect(subject.planes).to eq plane
  # end

  it "allows a plane to take-off, and returns confirmation that it is no longer in the airport" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.in_the_sky?).to eq true
  end

  it "'Sunny' -  allows take off" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    expect(subject.take_off(1)).to eq "You're clear for take off"
  end

  it "'Stormy' - disallows take off" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Stormy" }
    expect(subject.take_off(1)).to eq "You're not cleared for take off due to adverse weather conditions"
  end

  it "'Sunny' - allowed landing" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    expect(subject.landing(1)).to eq "You're clear for landing"
  end

  it "'Stormy' - disallows landing" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Stormy" }
    expect(subject.landing(1)).to eq "You're not cleared for landing due to adverse weather conditions"
  end
end
