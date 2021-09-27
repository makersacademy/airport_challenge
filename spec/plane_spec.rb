require 'plane'
require 'airport'
require 'weather_gen'

describe Plane do

  let(:weather) { double :weather_gen }
  subject(:plane) { described_class.new(weather) }
  let(:airport) { double :airport }
  
  describe '#instruct_plane_to_land' do
    it 'should land a plane at a given airport if not full and weather okay' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:add_plane).and_return(true)

      expect(plane.instruct_plane_to_land(airport)).to eq("Plane landed at airport")
      expect(plane.in_air?).to eq(false)
    end

    it 'should not land a plane at a given airport if the airport is full' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:add_plane).and_return(true)
      20.times do
        new_plane = described_class.new(weather)
        new_plane.instruct_plane_to_land(airport)
      end

      allow(airport).to receive(:full?).and_return(true)
      expect { plane.instruct_plane_to_land(airport) }.to raise_error("This airport is full, this plane cannot land")
      expect(plane.in_air?).to eq(true)
    end

    it 'should not land a plane if the plane is already at an airport' do
      allow(airport).to receive(:full?).and_return(false)
      allow(weather).to receive(:forecast_stormy?).and_return(false)
      allow(airport).to receive(:add_plane).and_return(true)
      plane.instruct_plane_to_land(airport)

      expect { plane.instruct_plane_to_land(airport) }.to raise_error("This plane is already in an airport, instruct the plane to takeoff before instructing it to land")
      expect(plane.in_air?).to eq(false)
    end

    it 'should not land a plane at a given airport if weather is stormy' do
      allow(weather).to receive(:forecast_stormy?).and_return(true)
      allow(airport).to receive(:full?).and_return(false)

      expect { plane.instruct_plane_to_land(airport) }.to raise_error("The weather is stormy, this plane cannot land")
      expect(plane.in_air?).to eq(true)
    end
  end

  describe '#instruct_plane_to_takeoff' do
    it 'should make plane takeoff if weather is fine' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:add_plane).and_return(true)
      allow(airport).to receive(:remove_plane).and_return(true)
      plane.instruct_plane_to_land(airport)

      expect(plane.instruct_plane_to_takeoff).to eq("Plane has taken off")
      expect(plane.in_air?).to eq(true)
    end

    it 'should not make plane takeoff if weather is stormy' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:add_plane).and_return(true)
      plane.instruct_plane_to_land(airport)
      allow(weather).to receive(:forecast_stormy?).and_return(true)

      expect { plane.instruct_plane_to_takeoff }.to raise_error("The weather is stormy, this plane cannot takeoff")
      expect(plane.in_air?).to eq(false)
    end

    it 'should not allow plane to takeoff if plane is not at an airport' do

      expect { plane.instruct_plane_to_takeoff }.to raise_error("This plane is not at an airport, land it at an airport before instructing it to takeoff")
      expect(plane.in_air?).to eq(true)
    end
  end

end
