require "airport"

describe Airport do

  subject = Airport.new(10)

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

    it 'raises an error when airport is full' do
    10.times {subject.land(Plane.new)}
    expect {subject.land(Plane.new)}.to raise_error "Airport full"
    end
  end

    it 'responds to planes' do
    expect(subject).to respond_to :planes
    end

end
