require "airport.rb"

describe Airport do

  context "#accept_plane" do
    plane = Plane.new

    it {is_expected.to respond_to :accept_plane}

    it "should confirm that a plane has landed" do
      Airport.any_instance.stub(stormy?: false)
      expect(subject.accept_plane(plane)).to eq "A plane has landed!"
    end

    it "should not accept a plane if the airport is full" do
      Airport.any_instance.stub(stormy?: false)
      airport = subject
      100.times { airport.accept_plane(Plane.new) }
      expect{(subject.accept_plane(plane))}.to raise_error("Error: The airport is full!")
    end

    it "should not accept a plane if the weather is stormy" do
      Airport.any_instance.stub(stormy?: true)
      expect{(subject.accept_plane(Plane.new))}.to raise_error("Error: Stormy weather is preventing the plane from landing")
    end

  end

  context "#release_plane" do

    plane = Plane.new
    it {is_expected.to respond_to :release_plane}

    it "should confirm that a plane has taken off as long as the airport has planes" do
      Airport.any_instance.stub(stormy?: false)
      subject.accept_plane(plane)
      expect(subject.release_plane(plane)).to eq "A plane has taken off!"
    end

    it "should not release a plane if no planes are at the airport" do
      Airport.any_instance.stub(stormy?: false)
      expect{(subject.release_plane(plane))}.to raise_error("Error: The airport is empty!")
    end

    it "should not release a plane if the weather is stormy" do
      Airport.any_instance.stub(stormy?: true)
      expect{(subject.release_plane(plane))}.to raise_error("Error: Stormy weather is preventing the plane from taking off")
    end

  end

  context "#capacity" do

    it {is_expected.to respond_to :plane_count}

    it "a new airport should return the count of planes at the airport" do
      expect(subject.plane_count).to eq 0
    end

    it {is_expected.to respond_to :full?}

    it {is_expected.to respond_to :empty?}

  end

  context "#stormy?" do

    it {is_expected.to respond_to :stormy?}

  end

end
