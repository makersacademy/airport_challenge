require './lib/airport.rb'

describe Airport do
  it "can create instances of itself" do
    expect(subject).to be_an(Airport)
  end
  it "can show planes currently at the airport" do
    p1 = Plane.new
    subject.land_plane(p1)
    expect(subject.planes).to eq(p1)
  end

  describe '#land_plane' do
    it "can be called on an airport with 1 argument" do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
    it "adds the landed plane to the airport" do
      p1 = Plane.new
      subject.land_plane(p1)
      expect(subject.planes).to eq(p1)
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
      expect(subject.planes).to eq(nil)
    end
    it "returns an error if the specified plane is not in the airport" do
      p1 = Plane.new
      expect{subject.take_off_plane(p1)}.to raise_error("Plane not at airport!")
    end
  end

end
