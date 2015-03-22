require 'airport'

describe Airport do

  context 'taking off and landing' do
    it 'a plane can land' do
      plane = double(:plane, land: :plane1)
      subject.arrival(plane.land)
      expect(subject.stationed_planes.last).not_to eq nil
    end

    it 'a plane can take off' do
      plane = double(:plane, land: :plane1, take_off: :plane1)
      subject.arrival(plane.land)
      subject.departure(plane.take_off)
      expect(subject.stationed_planes.last).to eq nil
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      plane = double(:plane, land: :plane1)
      Airport::DEFAULT_CAPACITY.times { subject.arrival(plane.land) }
      expect { subject.arrival(plane.land) }. to raise_error "Airport Full"
    end

    it 'can set a custom capacity' do
      random_capacity = rand(1..100)
      airport = Airport.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end

    it 'a plane cannot take off if it is not present' do
      plane = Plane.new
      subject.arrival(plane.land)
      subject.departure(plane.take_off)
      expect { subject.departure(plane.take_off) }.to raise_error "No plane"
    end
  end
  context 'weather conditions' do
    it 'a plane cannot take off when there is a storm brewing' do
      plane = Plane.new
      controlstorm = double(:control, forecast: :stormy)
      controlsun = double(:control, forecast: :sunny)
      subject.arrival(plane.land, controlsun.forecast)
      take_off = plane.take_off
      wthr = controlstorm.forecast
      expect { subject.departure(take_off, wthr) }.to raise_error "Too Stormy"
    end

    it 'a plane cannot land in the middle of a storm' do

    end
  end
end
