require 'plane'
require 'airport'
require 'weather_gen'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) {double :airport}
  let(:weather) {double :weather_gen}
  
  describe '#instruct_plane_to_land' do
    it 'should land a plane at a given airport if not full and weather okay' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)

      expect(plane.instruct_plane_to_land(airport)).to eq("Plane landed at airport")
      expect(plane.at_aiport?).to eq(true)
    end

    it 'should not land a plane at a given airport if the airport is full' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)
      20.times do
        new_plane = described_class.new
        new_plane.instruct_plane_to_land(airport)
      end

      expect{plane.instruct_plane_to_land(airport)}.to raise_error("Bla di ba")
      expect(plane.at_aiport?).to eq(false)
    end

    it 'should not land a plane at a given airport if weather is stormy' do
      allow(weather).to receive(:forecast_stormy?).and_return(true)

      expect{plane.instruct_plane_to_land(airport)}.to raise_error("Bla di ba")
      expect(plane.at_aiport?).to eq(false)
    end
  end

  describe '#instruct_plane_to_takeoff' do
    it 'should make plane takeoff if weather is fine' do
      allow(weather).to receive(:forecast_stormy?).and_return(false)

      expect(plane.instruct_plane_to_takeoff).to eq("Plane has taken off")
      expect(plane.at_aiport?).to eq(false)
    end

    it 'should not make plane takeoff if weather is stormy' do
      allow(weather).to receive(:forecast_stormy?).and_return(true)

      expect{plane.instruct_plane_to_land(airport)}.to raise_error("Bla di ba")
      expect(plane.at_aiport?).to eq(false)
    end
  end

end