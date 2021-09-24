require 'plane'

RSpec.describe Plane do
  describe ".land" do
    it "@flight_status = flying" do
      testplane = subject.initialise("flying")
      expect(subject.land).to eq("The plane has landed.")
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise("grounded")
      expect(subject.land).to eq("This plane is already grounded.")
    end
  end
end
