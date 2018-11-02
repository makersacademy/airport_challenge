require 'plane.rb'

describe Plane do

  it "will respond to #land" do
    expect(Plane.new).to respond_to(:land)
  end

  it 'will respond to #take_off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end

end
