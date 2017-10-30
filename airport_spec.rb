require 'airport'

describe Airport do
  it 'allows plane to land' do
    expect (Plane.new).to respond to (:allows_landing)
  end
end
