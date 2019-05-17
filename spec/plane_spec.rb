require_relative '../docs/plane'

describe Plane do
let(:plane) { Plane.new }

  it '.flying?' do
    expect(plane.flying?).to eq(true)
  end
end
