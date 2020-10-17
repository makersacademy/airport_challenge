require './lib/plane.rb'

RSpec.describe "Plane" do
  describe "land" do
  it "tells plane to land" do
    plane = Plane.new
    expect(plane.land).to eq(true)
  end
end


end
