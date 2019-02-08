require "airport"

describe Airport do

  context "#land_plane" do
    it "lands a plane to airport" do
      plane = Planes.new("Boing123")
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it "informs landing is not possible if weather is stormy" do
      plane = Planes.new("name")
      @stormy = true
      expect(subject.land_plane(plane)).to fail "Not safe to land when there is a storm!"
    end

  end

  context "#takeoff_plane" do
    it 'takes off a plane from airport if not stormy' do
      plane = Planes.new("name")
      @stormy = false
      expect(subject.takeoff_plane(plane)).to eq plane
    end

    it "informs take off is not possible if weather is stormy" do
      plane = Planes.new("name")
      @stormy = true
      expect(subject.takeoff_plane(plane)).to fail "Not safe to take off when there is a storm!"

    end

  end

end
