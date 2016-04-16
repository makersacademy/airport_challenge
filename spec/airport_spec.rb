require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "allows multiple planes to land" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes[0]).to eq plane
  end

  it "returns a message letting the user know the plane has landed" do
    plane = Plane.new
    expect(subject.land(plane)).to eq ("Plane has landed")
  end

  it "allows a plane to take off" do
    plane = Plane.new
    subject.land(plane)
        expect(subject.planes[0]).to eq plane

    subject.take_off(plane)
    expect(subject.planes[0]).not_to eq plane

  end

  it "returns a message letting the user know the plane has taken off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq ("Plane has taken off")
  end


end



