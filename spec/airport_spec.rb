require 'airport'
require 'plane'

describe Airport do
  describe '#initialize' do
    it "should allow a user to set the capacity" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end

    it "should have a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  it 'can land planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it can let planes take-off
  # it 'will not allow planes it doesn\'t have to take off'
  # it 'knows the weather'
  # it 'will not allow take-off or landing of planes during stormy weather'
  # it 'will not allow planes to land if it is full'

end
