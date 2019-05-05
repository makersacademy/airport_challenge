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
      message = 'Airport at capacity'
      expect { Plane.new.land_at(airport) }.to raise_error message
    end

    it 'should not be able to land if already landed' do
      not_stormy(airport)
      subject.land_at(airport)
      message = 'This plane is already landed'
      expect { subject.land_at(airport) }.to raise_error message
    end

    it 'should not be able to land in stormy weather' do
      stormy(airport)
      message = 'Too stormy to land'
      expect { subject.land_at(airport) }.to raise_error message
    end
  end

  describe '#take_off_from' do
    it 'should only take off from an airport it is in' do
      not_stormy(airport)
      message = 'The plane was not landed here'
      expect { subject.take_off_from(airport) }.to raise_error message
    end

    it 'should not be able to take off in stormy weather' do
      not_stormy(airport)
      subject.land_at(airport)
      stormy(airport)
      message = 'Too stormy to take off'
      expect { subject.take_off_from(airport) }.to raise_error message
    end
  end
end
