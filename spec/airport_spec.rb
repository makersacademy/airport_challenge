
require 'airport'

describe Airport do
  
  it 'has default airport capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


  describe '#take_off' do
    it 'raises an error when weather stormy' do
      subject = Airport.new
      plane = Plane.new
      expect{ subject.take_off(plane)}.to raise_error 'Stormy weather, do not take off!'
    end

    it 'plane takes off from airport' do
      plane = subject.landing_plane
      expect(subject).to respond_to :take_off
    end
  end

  describe '#land' do
    it 'raises an error when weather stormy' do
      subject = Airport.new
      plane = Plane.new
      expect{ subject.land(plane)}.to raise_error 'Stormy weather, do not land!'
    end

    it 'responds to landing_plane' do
      expect(subject).to respond_to :landing_plane
    end

    it 'prevents plane from landing if aiport is full' do
        20.times { subject.airport_capacity Plane.new }
        expect { subject.airport_capacity Plane.new }.to raise_error 'Airport is full'
      end
    end
  end
