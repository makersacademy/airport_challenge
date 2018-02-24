require 'plane.rb'

describe Plane do
  it 'checks if Plane exists ' do
  end

  it 'checks if it can be initialized with a destination' do
    airport_double = double
    plane1 = Plane.new(airport_double)
    expect(plane1.destination).to eq airport_double
  end
end
