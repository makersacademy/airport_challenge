require 'plane'
require 'storm_module'

RSpec.describe Plane do
  describe ".flying" do
    it "@flight_status = flying" do
      testplane = subject.initialise(1)
      expect(subject.flying).to eq("flying") 
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise(0)
      expect(subject.flying).to eq("grounded") 
    end
  end
  
  describe ".land" do
    it "@flight_status = flying" do
      testplane = subject.initialise(1)
      expect(subject.land).to eq("The plane has landed.")
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise(0)
      expect(subject.land).to eq("This plane is already grounded.")
    end
  end
	
	 describe ".take_off" do
    it "@flight_status = flying" do
      testplane = subject.initialise(1)
      expect(subject.take_off).to eq("This plane is already flying.")
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise(0)
      expect(subject.take_off).to eq("The plane takes off.")
    end

    describe ".storm" do
      it "@flight_status = flying" do
        testplane = subject.initialise("1")
        teststorm = double("guaranteedStorm", storm: 5)
        storm
        expect(subject.land).to eq("Too stormy to land.")
      end
    end
  end
end
