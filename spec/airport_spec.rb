require 'airport'

describe Airport do
  it 'can create an instance of airport' do
    expect(subject).to be_kind_of(Airport)
  end

  describe "#land" do
    it 'should respond to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it 'should respond to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'should make the plane to take off' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq(plane)
    end

    it 'should confirm that the plane is no longer in the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.took_off(plane)).to eq("The plane took off")
    end
  end

end
