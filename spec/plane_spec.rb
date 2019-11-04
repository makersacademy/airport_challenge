require 'plane'

describe Plane do
  it 'creates an instance of Planes' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  it 'responds to no_longer_in_airport?'do
  expect(subject).to respond_to :no_longer_in_airport?
  end
end
