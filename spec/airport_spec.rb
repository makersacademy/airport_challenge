require "airport"

describe Airport do

  describe '#takeoff' do

    it 'allows an airport to let a plane takeoff' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff).to eq plane
    end
  end

  describe '#land' do

      it 'has the land method receive a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'returns plane when a plane lands' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when airport is full' do
    subject.land(Plane.new)
    expect {subject.land(Plane.new)}.to raise_error "Airport full"
    end
  end

    it 'responds to plane' do
    expect(subject).to respond_to :plane
    end

    it 'returns plane when method is called' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
    end

end
