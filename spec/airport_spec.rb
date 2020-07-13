require 'airport'

describe Plane do
  it 'can land if sunny' do
    weather = double(:weather => 'sunny')
    expect(subject.land).to eq(true)
  end

  it 'can take off if sunny' do
    weather = double(:weather => 'sunny')
    expect(subject.take_off).to eq(true)
  end

  it 'cannot land nor take off if stormy' do
    weather = double(:weather => 'stormy')
    expect(subject.land).to eq(false)
    expect(subject.take_off).to eq(false)
  end
end

describe Airport do
  it 'stores plane when landed' do
    plane = Plane.new
    expect(subject.landing(plane)).to eq([plane])
  end

  it 'removes plane when took off' do
    plane = Plane.new
    plane.land
    expect(subject.taking_off(plane)).not_to include(plane)
  end

  it 'does not accept plane if full' do
    described_class::DEFAULT_CAPACITY.times do
      plane = Plane.new
      subject.landing(plane)
    end
    expect{subject.landing(Plane.new)}.to raise_error 'Plane cannot land'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'has a variable capacity' do
    airport = Airport.new(10)
    10.times {
      plane = Plane.new
      airport.landing(plane)
    }
    expect{airport.landing(Plane.new)}.to raise_error 'Plane cannot land'
  end
end