require "Airport.rb"

describe Airport do
  # it "test if plane can land" do
  #   plane = Plane.new
  #   subject.lane(plane)
  it 'lands plane' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end
end






