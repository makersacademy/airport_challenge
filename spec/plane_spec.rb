require 'plane'
describe Plane do
  it "Ground test to validate if Plane exist before it can land/take off" do
    expect(Plane.new).to be_a(Plane)
  end

end
