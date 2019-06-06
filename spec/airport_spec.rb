require 'airport'
require 'weather'
require 'plane'

describe Airport do

  plane = Plane.new

  describe '#land'

  it 'should display error message if airport is full' do
    3.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error("airport is full")
  end

  it 'should display error message if weather is stormy' do
    allow(@conditions).to receive(:rand).and_return("stormy")

    expect { subject.land(plane) }.to raise_error("stormy weather conditions")
  end

  it 'should allow plane to land at an airport' do
    allow(@conditions).to receive(:rand).and_return("sunny")
    subject.land(plane)

    expect(subject.planes).to include(plane)
  end

  describe '#takeoff'

  it 'should display error message if weather is stormy' do
    allow(@conditions).to receive(:rand).and_return("stormy")

    subject.takeoff
    expect { subject.takeoff }.to raise_error("stormy weather conditions")
  end

  it 'allows plane to takeoff from airport' do
    subject.takeoff
    expect(subject.takeoff).to eq(subject.planes.last)
  end

end
