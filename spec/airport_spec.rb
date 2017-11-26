require "airport"

describe Airport do

  # Tests for Airport responding to methods

     it "plane can land" do
       expect(subject).to respond_to (:dock)
     end

     it "plane can take off" do
       expect(subject).to respond_to (:launch)
     end


end
