require "Airport"
require "Plane"

describe Airport do
  subject(:Airport) {described_class.new}
  let(:Plane) { double :Plane }


  it {expect(subject).to respond_to(:land).with(1).argument}


  it "should allow planes to land" do
    plane = double(:plane)
    expect(subject.land(plane)).to eq plane
  end

  it "should only allow airborne plays to land" do
     plane = Plane.new
     expect{subject.land(plane, false)}.to raise_error ("Plane not in the air")
  end

end
