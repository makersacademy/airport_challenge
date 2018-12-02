require 'plane'

RSpec.describe Plane do

  plane = Plane.new

  it "will takeoff if instructed to" do
    expect(plane).to respond_to(:takeoff?)
  end

  it 'will land when instructed to' do
    expect(plane).to respond_to(:land?)
  end

end
