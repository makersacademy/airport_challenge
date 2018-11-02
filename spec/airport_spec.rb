require 'airport'

describe Airport do

  it "can be created" do
    expect(subject).to be_an(Airport)
  end

  it "has a default capacity of 10" do
    allow(subject).to receive(:weather).and_return("fine")

    10.times { Plane.new.land(subject) }

    expect(Plane.new.land(subject)).to eq false
  end

  it "can be created with a different capacity" do
    airport = Airport.new(5)
    allow(airport).to receive(:weather).and_return("fine")

    5.times { Plane.new.land(airport) }

    expect(Plane.new.land(airport)).to eq false
  end

  it "correctly responts to stormy_weather? when it's stormy" do
    allow(subject).to receive(:weather).and_return("stormy")

    expect(subject.stormy_weather?).to be true
  end

  it "correctly responts to stormy_weather? when it's fine" do
    allow(subject).to receive(:weather).and_return("fine")

    expect(subject.stormy_weather?).to be false
  end

  it "correctly responts to fine_weather? when it's fine" do
    allow(subject).to receive(:weather).and_return("fine")

    expect(subject.fine_weather?).to be true
  end

  it "correctly responts to fine_weather? when it's stormy" do
    allow(subject).to receive(:weather).and_return("stormy")

    expect(subject.fine_weather?).to be false
  end

end
