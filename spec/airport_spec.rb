require './lib/airport.rb'

RSpec.describe Airport do
  describe "land" do
    it "plane to land" do
      plane = Plane.new

      expect(subject.land(plane)).to eq(plane)
    end
  end

end
