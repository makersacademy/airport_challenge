require 'plane'

RSpec.describe Plane do
  describe ".take_off" do
    it "@flight_status = flying" do
      testplane = subject.initialise("flying")
      expect(subject.take_off).to eq("This plane is already flying.")
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise("grounded")
      expect(subject.take_off).to eq("The plane takes off.")
        
    end
  end
end
