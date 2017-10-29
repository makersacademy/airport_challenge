require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  describe "#planes" do
    it "should have a database of the planes at the airport" do
      expect(subject).to respond_to(:planes)
    end
  end

  describe "#dock" do
    it "should dock a plane that lands at the airport and update the database" do
      expect(subject).to respond_to(:dock).with(1).argument
      subject.dock(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe "#confirm_take_off" do
    it "receives a confirmation when a plane leaves the airport" do
      expect(subject).to respond_to(:confirm_take_off).with(1).argument
    end
    it "updates the database" do
      subject.dock(plane)
      subject.confirm_take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "#weather_conditions" do
    it "should show the weather in the airport area" do
      expect(subject).to respond_to(:weather_conditions)
      expect([:sunny, :stormy]).to include(subject.weather_conditions)
    end
  end

  describe "#capacity" do
    it { is_expected.to respond_to(:capacity) }
    it "should have a default max of 1 plane allowed in the airport" do
      expect(subject.capacity).to eq(1)
    end
    it "should override default capacity" do
      subject.capacity = 100
      expect(subject.capacity).to eq(100)
    end
  end

  describe "#full?" do
    it { is_expected.to respond_to(:full?) }
    it "should return true if the capacity is reached" do
      subject.dock(plane)
      expect(subject.full?).to eq(true)
    end
  end
end
