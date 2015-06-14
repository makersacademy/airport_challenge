require 'airport'
require_relative './support/shared_examples_for_weather_test'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'ready plane for take off' do

    it 'allows a plane to take off' do
      airport.ready_plane_for_take_off plane
      allow(airport).to receive(:report) { :sunny }
      expect(airport.landed_planes.count).to eq 0
    end
  end

  describe 'ready a plane for landing' do

    it 'allows a plane to land' do
      airport.ready_plane_for_landing plane
      allow(airport).to receive(:report) { :sunny }
      expect(airport.landed_planes.count).to eq 1
    end
  end

  context 'when weather conditions are stormy' do
    it 'does not allow a plane to take off' do
      airport.ready_plane_for_landing plane
      allow(airport).to receive(:report) { :stormy }
      airport.ready_plane_for_take_off plane
      expect(airport.landed_planes.count).to eq 1
    end

    it 'does not allow a plane to land' do
      airport.ready_plane_for_take_off plane
      allow(airport).to receive(:report) { :stormy }
      airport.ready_plane_for_landing plane
      expect(airport.landed_planes.count).to eq 0
    end
  end
end