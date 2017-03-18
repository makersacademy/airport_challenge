require 'airport'

describe Airport do

  describe "#initialize" do

    it 'checks default maximum capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "#land" do

    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'land takes 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'airport has the plane after landing' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'error raised if landing a plane when airport is full' do
      20.times {subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Airport Full")
    end

    it 'error raised if landing a plane that is not flying' do
      plane = Plane.new
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error("Plane already landed")
    end

  end

  describe "#take_off" do

    it 'responds to take_off' do
      expect(subject).to respond_to :take_off
    end

    it 'take_off takes 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'airport no longer has the plane after taking off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end
  end
end
