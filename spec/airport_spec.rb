require './lib/airport.rb'

describe Airport do
  it "can create instances of itself" do
    expect(subject).to be_an(Airport)
  end
  it "can take 1 argument" do
    expect(Airport).to respond_to(:new).with(1).argument
  end
  it "can show planes currently at the airport" do
    p1 = Plane.new
    subject.land_plane(p1)
    expect(subject.planes).to eq([p1])
  end
  it "has a default capacity of DEFAULT_CAPACITY" do
    a1 = subject
    expect{(Airport::DEFAULT_CAPACITY + 1).times{a1.land_plane(Plane.new)}}.to raise_error("Airport full!")
  end
  it "can be given a specified capacity" do
    user_capacity = 7
    a1 = Airport.new(user_capacity)
    expect{user_capacity.times{a1.land_plane(Plane.new)}}.not_to raise_error
    expect{(user_capacity + 1).times{a1.land_plane(Plane.new)}}.to raise_error("Airport full!")
  end

  describe '#land_plane' do
    it "can be called on an airport with 1 argument" do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
    it "adds the landed plane to the airport" do
      p1 = Plane.new
      subject.land_plane(p1)
      expect(subject.planes).to eq([p1])
    end
    it "registers a landed plane as not airborne" do
      a1 = Airport.new
      p1 = Plane.new
      a1.land_plane(p1)
      expect(p1.airborne).to eq false
    end
    it "cannot land an already landed plane" do
      a1 = Airport.new
      a2 = Airport.new
      p1 = Plane.new
      a1.land_plane(p1)
      expect{a2.land_plane(p1)}.to raise_error("Plane is not airborne!")
    end
  end

  describe '#take_off_plane' do
    it "can be called on an airport with 1 argument" do
      expect(subject).to respond_to(:take_off_plane).with(1).argument
    end
    it "removes the specified plane from the airport" do
      p1 = Plane.new
      subject.land_plane(p1)
      subject.take_off_plane(p1)
      expect(subject.planes).to eq([])
    end
    it "returns an error if the specified plane is not in the airport" do
      p1 = Plane.new
      expect{subject.take_off_plane(p1)}.to raise_error("Plane not at airport!")
    end
    it "registers to taking-off plane as airborne" do
      a1 = Airport.new
      p1 = Plane.new
      a1.land_plane(p1)
      a1.take_off_plane(p1)
      expect(p1.airborne).to eq(true)
    end
  end

end
