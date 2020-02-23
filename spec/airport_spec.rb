#   require "airport"
  
# describe Airport do
# let (:airplane) {double :airplane, :landed= => false, landed?: false}

#   it "there are no planes" do
#     expect(subject.planes).to eq []
#   end

#   it "land a plane and take off if there are no storms" do
#     airplane = Airplane.new
#     subject.storms = false
#     allow(airplane).to receive(:landed).and_return(false)
#     subject.land_plane(airplane)
#     subject.storms = true
#     allow(airplane).to receive(:landed). and_return(true)
#     expect(subject.takeoff_plane(airplane)).to raise_error("There is a storm coming Mr. Wayne")
#   end

#   it "airport is full" do
#     airplane = Airplane.new
#     expect{ subject.land_plane(airplane) == MAX_CAPACITY }.to raise_error("Airport is full")
#   end
# end

# describe Airplane do
#   it "is there a new plane?" do
#     expect(subject.landed).to eq true
#   end
# end

require 'airport'

describe Airport do
  it { expect(Airport.new).to respond_to(:release_plane) }

  it "gets a plane" do
    expect(Plane.new).to be_working
  end

  it "docks plane" do
    bike = Plane.new
    subject.dock(plane)
    expect(subject.plane)
  end

  it "no planes" do
      expect{subject.release_plane}.to raise_error("No planes bitches!")
  end

  it "raises an error when dock is full" do
    subject.dock(Plane.new)
    expect { subject.dock Plane.new }.to raise_error 'Full'
  end
end
