require 'airport'
require 'plane'


describe Airport do

subject(:airport) { described_class.new }
subject(:other_airport) { described_class.new }
let(:plane) { double :plane }

  it 'responds to land plane' do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to :land}

  it 'responds to land plane' do
    expect(subject).to respond_to :take_off
  end

  it { is_expected.to respond_to :take_off}

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end
 end

 describe '#take_off' do
   it 'lets a plane take off' do
   plane = Plane.new
   plane.landed
   expect(airport.instance_variable_get(:@planes)).to eq []
  end
 end

 describe '#land' do
   it 'raises an error when stormy weather' do
    airport = Airport.new
    plane = Plane.new
    airport.weather_stormy?
    expect { airport.land(plane) }.to raise_error 'Cannot land plane because of stormy weather'
   end
 end

 describe '#land' do
   it 'raises an error when airport full' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Cannot land plane because airport at full capacity'
    # airport = Airport.new
    # airport.full?
    # expect { airport.land(plane) }.to raise_error 'Cannot land plane because of stormy weather or at full capacity'
   end
 end

 describe '#land' do
   it 'raises an error when plane already on the ground' do
    plane = Plane.new
    plane.landed
    expect { subject.land(plane) }.to raise_error 'This plane is already on the ground at an airport'
   end
 end

describe '#land' do
 it 'should not allow a grounded plane to land again' do
      allow(plane).to receive(:on_the_ground).and_return true
      message =  "This plane is already on the ground at an airport"
      expect{airport.land(plane)}.to raise_error message
    end
  end

  describe '#take_off' do
   it 'should not allow an in-the-air plane to take off again' do
        allow(plane).to receive(:on_the_ground).and_return false
        message =  "This plane is already in the air"
        expect{airport.take_off(plane)}.to raise_error message
      end
    end

  describe '#take_off' do
   it 'should not allow take_off if plane not at airport' do
        airport.land(plane)
        airport.take_off(plane)
        # allow(plane).to receive(:on_the_ground).and_return false
        # allow(plane).to receive(:taken_off)
        message =  "This plane is not at this airport"
        expect{other_airport.take_off(plane)}.to raise_error message
      end
    end

end
