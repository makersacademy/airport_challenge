require 'plane'

describe Plane do
  it 'can create a plane' do
    # Arrange
    plane = Plane.new
    # Assert
    expect(plane.class).to eq(Plane)
  end
end
