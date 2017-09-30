require 'plane'

describe Plane do
  it 'lands' do
    plane = Plane.new(false)
    expect(plane.land).to eq(true)
  end


end
