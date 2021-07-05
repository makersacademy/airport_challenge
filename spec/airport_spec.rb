require 'airport'

describe Airport do
  it "Airport responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::MAX_PLANES
    end

  describe "#take_off" do
    it "raises error when no planes are available" do
      expect{subject.take_off}.to raise_error("No planes available to fly")
    end
  end

  it "responds to #land with one argument" do
     expect(subject).to respond_to(:land).with(1).argument
  end

  it "lands a aeroplane" do
    expect(subject.land(Plane)).to eq [Plane]
  end

  describe '#land' do
    it 'raises an error when full' do
      Airport::MAX_PLANES.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error "Aiport full, cannot land!"
    end
  end
end
