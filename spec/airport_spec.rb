require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it 'Airport allows landing plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes_landed).to include plane
  end

  it 'Airport allows planes to take off' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.planes_taken_off).to include plane
  end
end

# require './lib/airport.rb'
#
# airport = Airport.new
# plane = Plane.new
# airport.land(plane)
# airport.take_off(plane)
