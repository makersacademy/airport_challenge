require "airport"
require "plane"

describe Airport do
  # Name the subject explicitly
      subject(:airport) {described_class.new}
      
  # Tests for Airport responding to methods

     it "plane can land" do
       expect(subject).to respond_to (:dock)
     end

     it "plane can land" do

       expect(subject).to respond_to (:dock)
     end

     it "plane can take off" do
       expect(subject).to respond_to (:launch)
     end

     it "airport log how many planes are docked" do
       expect(subject).to respond_to (:count_of_planes)
     end

  # Test for docking and launching a plane and checking
  # how many planes are in the airport at any given time

     it "a plane lands" do
       # airport = Airport.new  --- Omitted as we have used subject(:airport) {described_class.new}
       plane = Plane.new
       airport.dock(plane)
       expect(airport.count_of_planes).to eq 1
     end

     it "a plane takes off" do
       # airport = Airport.new  --- Omitted as we have used subject(:airport) {described_class.new}
       plane = Plane.new
       airport.launch(plane)
       expect(airport.count_of_planes).to eq 0
     end


end
