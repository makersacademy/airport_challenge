
require "Airport"

describe Airport do

  subject(:airport) { Airport.new(weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  before do
    allow(plane).to receive(:working?)
    allow(weather).to receive(:stormy?) { false }  #alot of these tests may fail at random as you have not stubbed weather
  end

  describe '#take_off' do   #redundant state test now that programme is more complex #needs a new test based on behaviour
    it 'checks if Airport responds to the take_off method' do
      expect(subject).to respond_to(:take_off)
    end
  end

  describe '#land' do  #same as above: tests state
    it 'checks if Airport responds to the land method' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'adds the landed plane to the current planes in the airport' do
       plane = Plane.new #use the double you already created
       subject.land(plane)
       expect(subject.planes).to eq [plane]  #partially tests state with [] - think of another version for this test
    end

    it 'throws an error if trying to land a plane and the airport is at its default capacity' do
       plane = Plane.new #use double; but throws error if doing this x times?
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
      plane = Plane.new  # use double
      allow(weather).to receive(:stormy?) { true }
      expect { subject.check_to_land }.to raise_error ("Weather is stormy, cannot land")
    end
  end

  describe '#check_to_take_off' do
    it 'throws error if weather is stormy' do
      allow(weather).to receive(:stormy?) { true }
      expect { subject.check_to_take_off }.to raise_error("Weather is stormy, cannot take off")
    end

    it 'throws error if plane is not working' do
       allow(plane).to receive(:working?) { false }
       expect { subject.check_to_take_off }.to raise_error("Plane not functioning")
    end
  end

end
