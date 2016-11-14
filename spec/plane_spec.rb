require './lib/plane.rb'

describe Plane do

   it "should return true if plane has landed" do
   expect(subject.landed_status).to eq true
   end
end
