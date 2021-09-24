require 'plane'

RSpec.describe Plane do
  describe ".flying" do
    it "@flight_status = flying" do
      testplane = subject.initialise("flying")
      expect(subject.flying).to eq("flying") 
    end

    it "@flight_status = grounded" do
      testplane = subject.initialise("grounded")
      expect(subject.flying).to eq("grounded") 
    end
  end
  
  describe ".land" do
    it "c" do
      testplane = subject.initialise("flying")
      expect(subject.land).to eq("The plane has landed.")
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise("grounded")
      expect(subject.land).to eq("This plane is already grounded.")
    end
  end
	
	 describe ".take_off" do
    it "@flight_status = flying" do
      testplane = subject.initialise("flying")
      expect(subject.take_off).to eq("This plane is already flying.")
    end
    it "@flight_status = grounded" do
      testplane = subject.initialise("grounded")
      expect(subject.take_off).to eq("The plane takes off.")
        
    describe ".storm" do
      it "@flight_status = flying" do
      testplane = subject.initialise("flying")
      expect(subject.take_off).to eq("Plane ")
      end
    end
    end
  end
end
