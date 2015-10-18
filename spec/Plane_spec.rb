require "./lib/Plane.rb"

describe Plane do

  it "plane should be flying" do
    plane = Plane.new
    plane.flying
   expect(subject.flying).to eq false
  end



end
