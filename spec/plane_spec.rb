require 'rspec'
require 'spec_helper'
require 'plane'

describe Plane do
  # let(:airport) { double :airport }
  let(:weather) { double :weather }
  let(:airport) { double :airport }

  context '.land' do
    it 'does not land if the weather is stormy' do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(1)
      expect(weather.stormy).to eq(1)
      allow(airport).to receive(:capacity).and_return(true)
      expect(airport.capacity).to eq(true)
      expect(plane.land(weather, airport)).to eq 'stormy weather prevents landing'
    end

    it 'does not land if the airport is full' do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(0)
      expect(weather.stormy).to eq(0)
      allow(airport).to receive(:capacity).and_return(false)
      expect(airport.capacity).to eq(false)
      expect(plane.land(weather, airport)).to eq 'airport full, cannot land'
    end

    # it 'lands at the airport when instructed' do
    #   plane = Plane.new
    #   expect(plane.land).to eq true
    # end
  end

  context '.take_off' do
    it 'takes off if the weather is not stormy' do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(0)
      expect(weather.stormy).to eq(0)
      expect(plane.take_off(weather)).to eq 'take off'
    end

    it 'does not take off if the weather is stormy' do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(1)
      expect(weather.stormy).to eq(1)
      expect(plane.take_off(weather)).to eq 'stormy weather prevents take off'
    end

    it 'cannot take-off from an airport in which it has not landed' do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(0)
      expect(weather.stormy).to eq(0)
      allow(airport).to receive(:capacity).and_return(false)
      expect(airport.capacity).to eq(false)
      expect(plane.take_off(weather)).to eq 'take off'

    end
  end

  # context '.flying' do
  #   it 'confirms that it is flying' do
  #     plane = Plane.new

  #   end
  # end

end
