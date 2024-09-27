require 'plane'
require 'airport'
describe Plane do
  plane = Plane.new('Ryanair')

  it 'can track its current flying status' do
    expect(plane.flying?).to be false
    plane.change_status
    expect(plane.flying?).to be true
  end

end
