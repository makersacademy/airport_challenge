require 'plane'

RSpec.describe Plane do
  subject(:plane) { Plane.new }

  it "makes a plane land" do
    expect(plane).to respond_to :land
  end

  
end
