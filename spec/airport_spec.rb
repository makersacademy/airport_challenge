require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:sunny) { allow(subject).to receive(:weather).and_return('sunny') }
  let(:stormy) { allow(subject).to receive(:weather).and_return('stormy') }

  context '#instruct_landing' do
    it 'can instruct a plane to land at an airport' do
      plane.takeoff
      plane.land
      expect(plane.flying).to eq(false)
    end

    it 'can prevent a plane landing when the airport is full' do
      sunny
      subject.capacity.times { subject.instruct_landing(plane) }
      expect(subject.instruct_landing(plane)).to eq('Abort landing, airport is full')
    end
  end

  context '#instruct_takeoff' do
    it 'can intruct a plane to take off from an airport' do
      sunny
      subject.instruct_takeoff(plane)
      expect(plane.flying).to eq(true)
    end

    it 'confirms that the plane is no longer at the airport' do
      sunny
      expect(subject.instruct_takeoff(plane)).to eq('Plane has taken off and is no longer at the airport')
    end
  end

  describe '#weather' do
    it 'will prevent takeoff when weather is stormy' do
      stormy
      expect(subject.instruct_takeoff(plane)).to eq('The weather is not suitable for takeoff')
    end

    it 'will prevent landing when weather is stormy' do
      stormy
      expect(subject.instruct_landing(plane)).to eq('The weather is not suitable for landing')
    end

    it 'will takeoff when weather is not stormy' do
      sunny
      expect(subject.instruct_takeoff(plane)).to eq('Plane has taken off and is no longer at the airport')
    end

    it 'can allow a plane to land when it is not full or stormy' do
      sunny
      subject.instruct_takeoff(plane)
      expect(subject.instruct_landing(plane)).to eq('Plane has landed')
    end
  end

  it 'has a default capacity that can be overriden' do
    expect(subject.capacity).to eq(50)
    new_capacity = Airport.new(30)
    expect(new_capacity.capacity).to eq(30)
  end

  it 'can land and take off a number of planes' do
    sunny
    20.times { subject.instruct_takeoff(plane) }
    10.times { subject.instruct_landing(plane) }
    expect(subject.airport.length).to eq(10)
  end
end
