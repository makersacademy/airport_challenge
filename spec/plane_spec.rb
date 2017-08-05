require './docs/plane.rb'

describe Plane do
  it "lands" do
    expect(subject).to respond_to(:land)
  end

end
