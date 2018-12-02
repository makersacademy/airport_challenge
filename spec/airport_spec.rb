require "airport"
  describe Airport do 
    it { is_expected.to respond_to :land_plane }

    it "responds to plane taking off" do 
      expect(subject).to respond_to :take_off
    end 

	  it "allows us to land plane at airport" do
	    plane = Plane.new
	    expect(subject.land_plane(plane)).equal? [plane]
    end 	 
    
    it "allows plane to take off from airport" do 
    plane = Plane.new
    expect(subject.take_off(plane)).equal? plane
    end 
  end 

