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
end
