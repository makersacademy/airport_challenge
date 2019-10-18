require 'airport'

describe Airport do
  it 'creates and instance of Airport' do
    expect(subject).to be_an_instance_of Airport
  end

  it 'allows a plane to land at airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'allows a plane to takeoff from and airport' do
    plane = Plane.new
    subject.planes = [plane]
    subject.takeoff(plane)
    expect(subject.planes.include? plane).to eq false #1
  end

  describe "#takeoff" do
    it "stops takeoff if weather is stormy" do
      expect { subject.takeoff }.to raise_error "Weather is too dangers"
    end
  end
end