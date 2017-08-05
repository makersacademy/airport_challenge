require "Airport"
require "Plane"

describe Airport do
  subject(:Airport) {described_class.new}
  let(:Plane) { double :Plane }

# Landing tests
  it {expect(subject).to respond_to(:land).with(1).argument}


  it "should allow planes to land" do
    plane = double(:plane)
    expect(subject.land(plane)).to eq plane
  end

  it "should only allow airborne plays to land" do
     plane = Plane.new
     expect{subject.land(plane, false)}.to raise_error ("Plane not in the air")
  end

# Depart tests
  it {expect(subject).to respond_to :depart}

  it {expect(subject).to respond_to :show_planes}

  it {expect(subject).to respond_to :stock_planes}


  # Creates a plane, lands it and then departs.
  # The test shows the length of the array goes back to 0 as the departed plane
  # has now been deleted.
  it "a plane that has departed should no longer be in airport" do
    plane = Plane.new
    subject.land(plane)
    subject.depart(plane)
    expect(subject.planes.length).to eq 0
  end

  it "should show all the planes in the airport" do
    subject.stock_planes(15)
    expect(subject.show_planes.length).to eq 15
  end

  # Capacity tests

  it "should have a default capacity (10)" do
    expect(subject.capacity).to eq 10
  end

  it "planes can not land when airport is full" do
    plane = Plane.new
    subject.stock_planes
    expect{subject.land(plane)}.to raise_error ("Airport full")
  end


end
