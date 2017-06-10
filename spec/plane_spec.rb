require "plane.rb"
require "airport.rb"

describe Plane do

  describe '#status_arrived' do
    it "changes the status of the plane to arrived" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.status_arrived).to eq("arrived")
    end
  end
end
