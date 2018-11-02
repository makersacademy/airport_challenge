require 'airport'

describe Airport do

  it "can be created" do
    expect(subject).to be_an(Airport)
  end

  it "has a default capacity of 10" do
    expect(subject.capacity).to eq 10
  end

  it "can be created with a different capacity" do
    expect(Airport.new(5).capacity).to eq 5
  end

  it "correctly responds to stormy_weather? when it's stormy" do
    allow(subject).to receive(:weather).and_return("stormy")

    expect(subject.stormy_weather?).to be true
  end

  it "correctly responds to stormy_weather? when it's fine" do
    allow(subject).to receive(:weather).and_return("fine")

    expect(subject.stormy_weather?).to be false
  end

  it "correctly responds to fine_weather? when it's fine" do
    allow(subject).to receive(:weather).and_return("fine")

    expect(subject.fine_weather?).to be true
  end

  it "correctly responds to fine_weather? when it's stormy" do
    allow(subject).to receive(:weather).and_return("stormy")

    expect(subject.fine_weather?).to be false
  end

end
