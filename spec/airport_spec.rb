require 'airport'

describe Airport do

  subject {described_class.new}

  let(:Weather) {double :Weather}
  let(:plane1) {double :plane1}
  let(:plane2) {double :plane2}
  let(:act_weather) {double :act_weather}

  before(:each) do
    allow(plane1).to receive(:take_off).and_return(true)
    allow(plane1).to receive(:land).and_return(true)
    allow(Weather).to receive(:new).and_return(act_weather)
    allow(act_weather).to receive(:stormy?).and_return(false)
  end

  describe "initialize" do
    it "has a default capacity when initialized" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "can be override capacity" do
      random_capacity = Random.rand(75)
      airport = described_class.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end
  end

  describe "take_off" do

    it "responds to the method call" do
      expect(subject).to respond_to(:take_off).with(1).arguments
    end

    it "lets a plane to take off from the airport in sunny weather" do
      subject.land(plane1)
      expect(subject.take_off(plane1)).to eq("The plane has left the airport")
    end

    it "doesn't let a plane to take off in stormy weather" do
      subject.land(plane1)
      allow(act_weather).to receive(:stormy?).and_return(true)
      expect{subject.take_off(plane1)}.to raise_error
    end

    it "doesn't let the plane to take off if it's not at this airport" do
      expect{subject.take_off(plane1)}.to raise_error(RuntimeError)
    end

  end

  describe "land" do

    it "responds to the method call" do
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it "lets a plane to land in sunny weather" do
      expect(subject.land(plane1)).to eq("The plane has landed")
    end

    it "doesn't let a plane to land in stormy weather" do
      allow(act_weather).to receive(:stormy?).and_return(true)
      expect{subject.land(plane1)}.to raise_error(RuntimeError)
    end

    it "doesn't let a plane to land if the airport if full" do
      airport = Airport.new(1)
      airport.land(plane1)
      expect{airport.land(plane2)}.to raise_error(RuntimeError)
    end
  end
end
