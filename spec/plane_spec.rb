require './lib/plane.rb'

describe Plane do
  it "should be able to #land" do
    expect(subject).to respond_to :land
  end
end
