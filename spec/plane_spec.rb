require "plane.rb"
require "airport.rb"

describe Plane do

  let(:airport) { double :airport }

  describe '#status_arrived' do
    it "changes the status of the plane to arrived" do
      subject.status_arrived
      expect(subject.status).to eq("arrived")
    end
  end

  describe '#status_departed' do
    it "changes the status of the plane to departed" do
      subject.status_departed
      expect(subject.status).to eq("departed")
    end
  end

  describe '#available?' do
    it "checks if the plane is available at the airport" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.available?(airport)).to be true
    end
  end
end
