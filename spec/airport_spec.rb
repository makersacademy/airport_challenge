require 'airport.rb'

  describe Airport do

    it "should respond to planes landing" do
    expect(subject).to respond_to :plane_landed
  end

  it "should equal plane that has landed" do
    saa_plane = Plane.new
    expect(subject.plane_landed(saa_plane)).to eq "Plane #{saa_plane} has landed"
  end

  it "should show that airport class responds to the store_plane method" do
    expect(subject).to respond_to :store_plane
  end

  it "should show that the airport is storing unused planes" do
    saa_plane = Plane.new
    expect(subject.store_plane(saa_plane)).to eq [saa_plane]
  end

  it "should show that airport class response to available planes method" do
    expect(subject).to respond_to :planes
  end

  # it "should raise an error when the amount of planes in the airport if full and a plane is trying to land" do
  #   Airport::DEFAULT_CAPACITY.times {subject.store_plane(Plane.new)}
  #   saa_plane = Plane.new
  #   expect(subject.plane_landed(saa_plane)).to raise_error("This airport is full to capacity, please go to the next nearest airport to land")
  # end
end
