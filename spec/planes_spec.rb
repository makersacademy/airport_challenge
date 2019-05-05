require 'planes'

describe Plane do
  let(:airport) { Airport.new }

  def not_stormy(airport)
    allow(airport.weather).to receive(:stormy?) { false }
  end

  def stormy(airport)
    allow(airport.weather).to receive(:stormy?) { true }
  end

  describe '#land_at' do
    it 'should not be able to land if airport at capacity' do
      not_stormy(airport)
      airport.capacity.times { Plane.new.land_at(airport) }
      expect { Plane.new.land_at(airport) }.to raise_error 'Airport at capacity'
    end

    it 'should not be able to land if already landed' do
      not_stormy(airport)
      subject.land_at(airport)
      expect { subject.land_at(airport) }.to raise_error 'This plane is already landed'
    end

    it 'should not be able to land in stormy weather' do
      stormy(airport)
      expect { subject.land_at(airport) }.to raise_error 'Too stormy to land'
    end
  end

  describe '#take_off_from' do
    it 'should only take off from an airport it is in' do
      not_stormy(airport)
      expect { subject.take_off_from(airport) }.to raise_error 'The plane is not landed here'
    end

    it 'should not be able to take off in stormy weather' do
      not_stormy(airport)
      subject.land_at(airport)
      stormy(airport)
      expect { subject.take_off_from(airport) }.to raise_error 'Too stormy to take off'
    end
  end
end
