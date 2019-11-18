
require "Airport"

describe Airport do

  describe '#take_off' do
    it 'checks if Airport responds to the take_off method' do
      expect(subject).to respond_to(:take_off)
    end
  end

  describe '#land' do
    it 'checks if Airport responds to the land method' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'adds the landed plane to the current planes in the airport' do
       plane = Plane.new
       subject.land(plane)
       expect(subject.planes).to eq [plane]
    end

    it 'throws an error if trying to land a plane and the airport is at its default capacity' do
       plane = Plane.new
       Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
       expect { subject.land(plane) }.to raise_error("Airport full")
    end

    it 'throws an error if trying to land a plane that is not a plane' do
       plane = 'Plane'
       expect { subject.land(plane) }.to raise_error('Not a plane')
    end
  end

  describe '#check_to_land' do
    it 'throws error if weather is too stormy to land' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 1 }
      expect { subject.check_to_land }.to raise_error ("Weather is stormy, cannot land")
    end
  end

  describe '#check_to_take_off' do
    it 'throws error if weather is stormy' do
      allow(subject).to receive(:weather) { 1 }
      expect { subject.check_to_take_off }.to raise_error("Weather is stormy, cannot take off")
    end

    # it 'throws error if plane is not working' do
    #    plane = Plane.new
    #    allow(plane).to receive(:working?) { false }
    #    expect { subject.check_to_take_off }.to raise_error("Plane not functioning")
    # end
  end

end
