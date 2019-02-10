require 'airport'

describe Airport do

  describe 'landing planes' do
    it 'instructs a plane to land at the airport' do
      subject = Airport.new(20)
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'holds a plane in the airport when it lands (assuming good weather)' do
      subject = Airport.new(20)
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      new_plane = double('plane')
      subject.land(new_plane)
      expect(subject.planes_landed).to include(new_plane)
    end
    it 'returns an error if landed plane is instructed to land (again)' do
      subject = Airport.new(20)
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      new_plane = double('plane')
      subject.land(new_plane)
      expect { subject.land(new_plane) }.to raise_error 'plane already landed in airport!'
    end
  end

  describe 'taking off planes' do
    it 'instructs a plane to take off from the airport' do
      subject = Airport.new(20)
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'removes plane from airport once instructed to take off (assuming good weather)' do
      subject = Airport.new(20)
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      new_plane = double('plane')
      subject.land(new_plane)
      subject.take_off(new_plane)
      expect(subject.planes_landed).not_to include(new_plane)
    end
  end

  it 'checks plane is no longer in the airport' do
    subject = Airport.new
    allow(subject.weather).to receive(:stormy_currently?).and_return false
    new_plane = double('plane')
    subject.land(new_plane)
    subject.take_off(new_plane)
    expect(subject.in_airport?(new_plane)).to eq(false)
  end

  it 'cannot take off a plane if there are none in the airport' do
    subject = Airport.new
    allow(subject.weather).to receive(:stormy_currently?).and_return false
    new_plane = double('plane')
    expect { subject.take_off(new_plane) }.to raise_error 'cannot take off, plane not in airport!'
  end

  context 'when stormy' do

    it 'prevents planes taking off' do
      subject = Airport.new(20)
      new_plane = double('plane')
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      subject.land(new_plane)
      allow(subject.weather).to receive(:stormy_currently?).and_return true
      expect { subject.take_off(new_plane) }.to raise_error 'cannot take off when stormy'
    end

    it 'prevents planes landing' do
      subject = Airport.new(20)
      new_plane = double('plane')
      allow(subject.weather).to receive(:stormy_currently?).and_return true
      expect { subject.land(new_plane) }.to raise_error 'cannot land when stormy'
    end
  end

  describe 'testing capacity of airport' do
    it 'accepts capacity passed as argument when initializing new airport' do
      subject = Airport.new(20)
      expect(subject.capacity).to eq(20)
    end

    it 'prevents a plane landing if airport is at capacity (and good weather)' do
      subject = Airport.new(3)
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      plane1 = double('plane')
      subject.land(plane1)
      plane2 = double('plane')
      subject.land(plane2)
      plane3 = double('plane')
      subject.land(plane3)
      plane4 = double('plane')
      expect { subject.land(plane4) }.to raise_error 'cannot land - airport full'
    end

    it 'reverts to a default capacity if no capacity given' do
      subject = Airport.new
      expect(subject.capacity).to eq(10)
    end

    it 'allows capacity to be overridden at any time' do
      subject = Airport.new
      subject.edit_capacity = 5
      expect(subject.capacity).to eq(5)
    end

    it 'stops capacity being reduced to less than current number of planes' do
      subject = Airport.new(2)
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      plane1 = double('plane')
      subject.land(plane1)
      plane2 = double('plane')
      subject.land(plane2)
      expect { subject.edit_capacity = 1 }.to raise_error 'less than current planes'
    end
  end
end
