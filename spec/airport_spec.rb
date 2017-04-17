require 'plane'
require 'airport'
require 'weather'

describe Airport do

  describe '#initalize' do
    it 'sets a default capacity for each airport' do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times do
        subject.planes.push(plane)
      end
      expect { plane.land(subject) }.to raise_error "Airport is full, can't land"
    end

    it 'expect every new airport to have the capacity for planes' do
      expect(subject.planes).to eq []
    end
  end

  describe '#planes' do
    it 'expect a plane that has landed to exist at the airport' do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      plane.land(subject)
      expect(subject.planes).to include plane
    end

    it 'expect a plane that has not landed to not exist at the airport' do
      plane = Plane.new
      expect(subject.planes).not_to include plane
    end
  end
end
