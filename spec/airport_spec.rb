require 'airport'

describe Airport do
  it 'can instruct a plane to land at an airport' do
    subject.land
    expect(subject.airport).to include('plane')
  end

  describe '#takeoff' do
    it 'can intruct a plane to take off from an airport' do
      subject.land
      subject.takeoff
      expect(subject.airport).to be_empty
    end

    it 'confirms that the plane is no longer at the airport' do
      subject.land
      subject.takeoff
      expect(subject.message).to eq('Plane has taken off and is no longer at the airport')
    end
  end

  it 'can prevent a plane landing when airport is full' do
    full = Airport.new(20)
    20.times { full.land }
    full.prevent_landing
    expect(full.message).to eq('Abort landing, airport is full')
  end

  describe '#weather' do
    it 'will prevent takeoff when weather is stormy' do
      subject.land
      allow(subject).to receive(:weather).and_return('stormy')
      subject.prevent_takeoff
      expect(subject.message).to eq('The weather is not suitable for takeoff')
    end

    it 'will prevent landing when weather is stormy' do
      subject.land
      allow(subject).to receive(:weather).and_return('stormy')
      subject.prevent_landing
      expect(subject.message).to eq('The weather is not suitable for landing')
    end

    it 'will takeoff when weather is not stormy' do
      subject.land
      allow(subject).to receive(:weather).and_return('sunny')
      subject.prevent_takeoff
      expect(subject.message).to eq('Plane has taken off and is no longer at the airport')
    end

    it 'can allow a plane to land when it is not full or stormy' do
      allow(subject).to receive(:weather).and_return('sunny')
      subject.prevent_landing
      expect(subject.message).to eq('Plane has landed')
    end
  end

  it 'has a default capacity that can be overriden' do
    expect(subject.capacity).to eq(50)
    new_capacity = Airport.new(30)
    expect(new_capacity.capacity).to eq(30)
  end

  it 'can land and take off a number of planes' do
    20.times { subject.land }
    10.times { subject.takeoff }
    expect(subject.airport.length).to eq(10)
  end
end
