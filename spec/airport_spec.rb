require "airport"

describe Airport do

  before(:each) do
    @plane = Plane.new
    @weather = double(:weather)
    allow(@weather).to receive(:stormy?) { false }
  end

  describe "#land" do

    it "should store the plane in the airport" do
      expect(subject.land(@plane, @weather)).to eq [@plane]
    end

    it "gives an error if capacity is full" do
      airport = Airport.new
      expect { 21.times { airport.land(Plane.new, @weather) } }.to raise_error("There is no space avaliable!")
    end

    it "gives an error if capacity 25 when an argument of 25 is passed" do
      airport = Airport.new(25)
      expect { 26.times { airport.land(Plane.new, @weather) } }.to raise_error("There is no space avaliable!")
    end

    it "gives an error if capacity 15 when an argument of 15 is passed" do
      airport = Airport.new(15)
      expect { 16.times { airport.land(Plane.new, @weather) } }.to raise_error("There is no space avaliable!")
    end

    it "gives an error if you try to land the same plane twice" do
      subject.land(@plane, @weather)
      expect { subject.land(@plane, @weather) }.to raise_error("This plane has already landed")
    end

    it 'gives an error if you try to land during a storm' do
      allow(@weather).to receive(:stormy?) { true }
      expect { subject.land(@plane, @weather) }.to raise_error("There is currently a storm no landings at this time")
    end

  end

  describe "#take_off" do

    it "should return the plane that has left" do
      subject.land(@plane, @weather)
      expect(subject.take_off(@plane, @weather)).to eq @plane
    end

    it "gives an error if there's no planes in the airport" do
      expect { subject.take_off(Plane.new, @weather) }.to raise_error("There are currently no planes ready for take off")
    end

    it "gives an error if you try to get an absent plane to take off" do
      plane_1, plane_2 = Plane.new, Plane.new
      subject.land(plane_1, @weather)
      expect { subject.take_off(plane_2, @weather) }.to raise_error("This plane is not in this airport")
    end

    it 'gives an error if you try to land during a storm' do
      subject.land(@plane, @weather)
      allow(@weather).to receive(:stormy?) { true }
      expect { subject.take_off(@plane, @weather) }.to raise_error("There is currently a storm no take offs at this time")
    end
  end

  describe "#initialize" do
  
    it "should have no planes when initilized" do
      expect(subject.planes).to eq []
    end

    it "should have space for 20 planes when no argument is given" do
      expect(subject::capacity).to eq 20
    end

    it "should have space for 30 planes when an argument of 30 is given" do
      airport = Airport.new(30)
      expect(airport::capacity).to eq 30
    end

  end

end
