require_relative '../docs/plane'

describe Plane do
  it '.flying?' do
    plane = Plane.new
    expect(plane).to respond_to(:flying?)
  end
end
