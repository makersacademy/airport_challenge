require 'airport'

describe Airport do
  it 'Should have an airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  it 'Should have a defualt capacity' do
    expect(subject.capacity).to eq(10)
  end

  it 'Should be able to have a defualt capacity set' do
    expect(Airport.new(100).capacity).to eq(100)
  end

  describe '#land' do
    it 'Should respond to #land' do
      expect(subject).to respond_to(:land)
    end

    let(:plane) { Plane.new }
    it 'Should #land a plane in the airport' do
      expect(subject.land(plane)[0]).to eq(plane)
    end

    it 'should not let a plane land if airport is full' do
      allow(subject).to receive(:rand) { 1 }
      10.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error("Airport full")
    end

    it 'Should not let a plane land in a storm,' do
      allow(subject).to receive(:rand) { 5 }
      expect(subject.land(plane)).to eq("You must wait due to a storm")
    end
  end

  describe '#take_off' do
    it 'Should respond to #take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'Should confirm that a plane as taken off' do
      expect(subject.take_off).to eq("Plane has taken off")
    end

    it 'Should not let a plane takeoff in a storm,' do
      allow(subject).to receive(:rand) { 5 }
      expect(subject.take_off).to eq("You must wait due to a storm")
    end
  end

  describe '#weather_check' do
    it 'Should respond to #weather_check' do
      expect(subject).to respond_to(:weather_check)
    end

    it 'Should return a true' do
      allow(subject).to receive(:rand) { 3 }
      expect(subject.weather_check).to eq(true)
    end

    it 'Should return a false' do
      allow(subject).to receive(:rand) { 5 }
      expect(subject.weather_check).to eq(false)
    end
  end
end
