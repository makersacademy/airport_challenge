require 'airport'

describe Airport do

  it 'lands the plane with a land() method' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can land a plane' do
    plane = Plane.new

    subject.land(plane)

    expect(subject.planes).to eq [plane]
  end

  it 'can land multiple planes' do
    plane1 = Plane.new
    plane2 = Plane.new

    subject.land(plane1)
    subject.land(plane2)

    expect(subject.planes).to eq [plane1, plane2]
  end

  it 'can take off a landed plane' do
    plane = Plane.new
    subject.land(plane)

    subject.take_off(plane)

    expect(subject.planes).to be_empty
  end

  it 'can take off a landed plane without affecting other landed planes' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new

    subject.land(plane1)
    subject.land(plane2)
    subject.land(plane3)

    subject.take_off(plane2)

    expect(subject.planes).to eq [plane1, plane3]
  end

end
