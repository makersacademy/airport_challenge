require 'airport'
require 'plane'

describe Airport do
  it 'lands a plane' do
    plane = Plane.new
    subject.land
    expect(subject).to respond_to(:land)
  end
end
