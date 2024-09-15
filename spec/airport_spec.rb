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
  it "is created with good weather" do
    expect(subject.weather).to eq("sunny")
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
    it "cannot work if the weather is stormy" do
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

  describe "#weather_generate" do
    it "changes the weather to stormy roughly 1 in 10 times" do
      a1 = subject
      # generate weather 5000 times, store results in a 'histogram' hash called 'weather frequencies'
      weather_frequencies = Hash.new(0)
      for i in 1..5000
        a1.weather_generate
        weather_frequencies[a1.weather] += 1
      end
      # after 5000 generations, would expect the frequency of "sunny" to be roughly 10 times greater than that of "stormy"
      expect(weather_frequencies["sunny"] / weather_frequencies["stormy"]).to be_within(2).of(10)
    end
  end

end
