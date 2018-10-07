require 'airport'

describe Airport do

  it 'lands the plane with a land() method' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can land planes' do
    plane = Plane.new

    subject.land(plane)

    expect(subject.planes.first).to eq plane
  end

  it 'can take off planes' do
    plane = Plane.new
    subject.land(plane)

    subject.take_off(plane)
    
    expect(subject.planes).to be_empty
  end
end
