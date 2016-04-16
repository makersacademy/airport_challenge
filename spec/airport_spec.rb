require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  it "allows multiple planes to land" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes[0]).to eq plane
  end

  it "returns a message letting the user know the plane has landed" do
    plane = Plane.new
    expect(subject.land(plane)).to eq ("Plane has landed")
  end

end



