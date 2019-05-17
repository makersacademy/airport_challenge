require_relative '../docs/plane'

describe Plane do
  it 'responds to .flying?' do
    plane = Plane.new
    expect(plane).to respond_to(:flying?)
  end

  it '.flying?' do
    plane = Plane.new
    expect(plane.flying?).to eq(true)
  end
end
