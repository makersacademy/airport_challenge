require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
  describe '#take_off' do
    it 'confirms that the plane has left the airport' do
      expect(subject.take_off(airport)).to eq true
    end
    it "a flying plane can't take off" do
      plane = Plane.new(true)
      expect{ plane.take_off(airport) }.to raise_error "This plane is in the air"
    end

  end

  describe '#land' do
    it "lands a plane into an airport" do
      plane = Plane.new(true)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:store_plane)
      expect(plane.land(airport)).to eq false
    end

    it "can't land a plane that isn't flying" do
      expect{ subject.land(airport) }.to raise_error "The plane cannot be landed"
    end

    it "can't land at a full airport" do
      expect{ subject.land(airport) }.to raise_error "The plane cannot be landed"
    end 
  end
end


