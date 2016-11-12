require 'airport'
describe Airport do

  it { is_expected.to be_instance_of(Airport) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "tells a plane to land" do
    plane = Plane.new
    subject.land(plane)
    expect(plane).to eq subject.planes.last
  end

  it "confirms that a plane is landed there" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.landed?(plane)).to eq true
  end

  it "informs if the plane is not landed at this airport" do
    expect(subject.landed?(Plane.new)).to eq false
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "instructs a plane to take_off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include plane
  end

  it "confirms that plane is away" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.took_off?(plane)).to eq true
  end

  it "informs that the plane has not taken off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.took_off?(plane)).to eq false
  end

end
