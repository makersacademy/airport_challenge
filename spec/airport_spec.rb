require 'airport'

describe Airport do
  it 'displays current weather conditions' do
    is_expected.to respond_to(:weather)
  end

  it 'is created with initial weather conditions' do
    expect(Airport.new.weather).not_to eq nil
  end

  it 'displays current number of planes' do
    is_expected.to respond_to(:number_of_planes)
  end

  it 'is created with an initial number of planes' do
    expect(Airport.new.number_of_planes).not_to eq nil
  end

  it 'adds one to number of planes when a plane lands' do
    expect{ Plane.new.land(subject) }.to change{ subject.number_of_planes }.by(1)
  end

  it 'subtracts one from number of planes when a plane takes off' do
    expect{ Plane.new.take_off(subject) }.to change{ subject.number_of_planes }.by(-1)
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(25)
      25.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error 'Unable to land at full airport'
    end
  end
end