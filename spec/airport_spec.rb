require 'airport'

describe Airport do
  it 'holds a landed plane' do
    plane = double("plane")
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'allows a plane to takeoff' do
    plane = double("plane")
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
  end
end
