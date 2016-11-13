require "airport.rb"

describe Airport do

  context "#accept_plane" do
    plane = Plane.new

    it {is_expected.to respond_to :accept_plane}

    it "should confirm that a plane has landed" do
      expect(subject.accept_plane(plane)).to eq "A plane has landed!"
    end

  end

  context "#release_plane" do
    plane = Plane.new
    it {is_expected.to respond_to :release_plane}

    it "should confirm that a plane has taken off" do
      expect(subject.release_plane(plane)).to eq "A plane has taken off!"
    end

  end

end
