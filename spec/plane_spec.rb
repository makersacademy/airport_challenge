
require "plane"


describe Plane do
  subject(:plane) { described_class.new }

	it 'is flying' do
    expect(plane).not_to be_in_airport
  end
	it 'is has landed' do
    plane.land
    expect(plane).to be_in_airport
  end
  it 'is has departed' do
    plane.depart
    expect(plane).not_to be_in_airport
  end
end