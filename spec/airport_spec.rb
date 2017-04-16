require './lib/airport.rb'

describe Airport do

  describe "#land a plane" do
    it 'lands a plane when a plane is passed' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'finds the plane that has been landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq subject.planes
    end
  end

  describe "#let a plane take off" do

    it "a plane is received on take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it "unable to let a plane that doesn't exist take off" do
      expect{ subject.take_off }.to raise_error "No planes available"
    end

    it "confirm that the plane is no longer at the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to be_empty
    end
  end

end
