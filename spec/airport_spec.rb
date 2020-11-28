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
  it "has a capacity of 1" do
    a1 = subject
    expect{2.times{a1.land_plane(Plane.new)}}.to raise_error("Airport full!")
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
  end

end
