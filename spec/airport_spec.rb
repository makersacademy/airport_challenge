require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    @my_plane = Plane.new
    @my_airport = Airport.new
  end
  
  describe "#airport capacity" do
    it "ensures a default capacity of 20 is set" do
      expect(@my_airport.instance_variable_get(:@capacity)).to eq 5
    end
    
    it "enables user to override airport capacity" do
      another_airport = Airport.new(10)
      expect(another_airport.instance_variable_get(:@capacity)).to eq 10
    end
  end

  describe "#lands planes" do

    it "plane that has landed can be found in the airport" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
      @my_airport.land(@my_plane)
      expect(@my_airport.send(:planes).last).to eq @my_plane
    end

    it "planes already at airportcannot land" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
      @my_airport.land(@my_plane)
      message = "Plane is already at airport"
      expect { @my_airport.land(@my_plane) }.to raise_error message
    end

    it "planes landed at different airport cannot land" do
      another_airport = Airport.new
      allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
      allow(another_airport.send(:weather)).to receive(:stormy?) { false }
      @my_airport.land(@my_plane)
      message = "Plane has already landed somewhere else"
      expect { another_airport.land(@my_plane) }.to raise_error message
    end

    it "prevents landing when airport is full" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
      5.times { @my_airport.land(Plane.new) }
      message = "Airport is at full capacity"
      expect { @my_airport.land(@my_plane) }.to raise_error message
    end

    it "prevent landing when weather is stormy" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { true }
      message = "Weather is too bad"
      expect { @my_airport.land(@my_plane) }.to raise_error 
    end
  end

  describe "#takes off planes" do
    it "after plane takes off, it is no longer at the airport" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
      @my_airport.send(:planes) << @my_plane
      @my_airport.take_off(@my_plane)
      expect(@my_airport.send(:planes).length).to eq 0
    end

    it "planes can only take off from airport they are in" do
      another_airport = Airport.new
      allow(another_airport.send(:weather)).to receive(:stormy?) { false }
      @my_airport.send(:planes) << @my_plane
      message = "this plane isn't at the airport"
      expect { another_airport.take_off(@my_plane) }.to raise_error message
    end

    it "don't let plane take off if weather is stormy" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { true }
      @my_airport.send(:planes) << @my_plane
      message = "Weather is too bad"
      expect { @my_airport.take_off(@my_plane) }.to raise_error message
    end

    it "planes that are flying cannot take off" do
      allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
      @my_airport.send(:planes) << @my_plane
      @my_airport.take_off(@my_plane)
      message = "this plane isn't at the airport"
      expect { @my_airport.take_off(@my_plane) }.to raise_error message
    end
  end
end

describe "#feature test with two airports, three planes and only sunny weather", type: :feature do

  before(:each) do
    @my_airport = Airport.new
    @another_airport = Airport.new
    @plane_1 = Plane.new
    @plane_2 = Plane.new
    @plane_3 = Plane.new
    allow(@my_airport.send(:weather)).to receive(:stormy?) { false }
    allow(@another_airport.send(:weather)).to receive(:stormy?) { false } 
  end

  it "planes travel between airports with one left at each" do
    the_planes_land
    one_travels_between_airports
    this_plane_takes_off_again
    should_be_only_first_plane_at_my_airport
    should_be_only_second_plane_at_another_airport
    third_plane_should_not_be_landed
  end

  def the_planes_land
    @my_airport.land(@plane_1)
    @my_airport.land(@plane_2)
    @another_airport.land(@plane_3)
  end

  def one_travels_between_airports
    @my_airport.take_off(@plane_2)
    @another_airport.land(@plane_2)
  end

  def this_plane_takes_off_again
    @another_airport.take_off(@plane_3)
  end

  def should_be_only_first_plane_at_my_airport
    expect(@my_airport.send(:planes).last).to eq(@plane_1)
  end

  def should_be_only_second_plane_at_another_airport
    expect(@another_airport.send(:planes).last).to eq(@plane_2)
  end

  def third_plane_should_not_be_landed
    expect(@plane_3.landed).to eq(false)
  end
end
