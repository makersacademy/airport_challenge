require './lib/Plane.rb'

describe Plane do
  it 'Should give the name of the plane' do
    plane = Plane.new("name")
    expect(plane.name).to eq "name"
  end
end
