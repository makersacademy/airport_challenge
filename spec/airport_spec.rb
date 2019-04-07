require 'airport'

RSpec.describe AirPort do

  RSpec.configure do |config|
    config.example_status_persistence_file_path = './spec/fail_test.txt'
  end 

  subject(:airport) { described_class.new(10) }
  let(:plane) { Plane.new }

  describe '#land_plane' do
    it 'should be able to land plane' do
      allow(airport).to receive(:at_airport?).with(plane).and_return(false)
      allow(airport).to receive(:bad_weather?).and_return(false)
      expect(airport.land(plane)).to eq([plane])
    end
    it ' should raise and error when there is a stormy weather' do
      allow(airport).to receive(:at_airport?).with(plane).and_return(false)
      allow(airport).to receive(:bad_weather?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Sorry: can not land plane due to stormy weather' 
    end

    it 'should raise an error when airport is full' do
      allow(airport).to receive(:at_airport?).with(plane).and_return(false)
      allow(airport).to receive(:bad_weather?).and_return(false)
      10.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Sorry: can not land plane, airport is full.' 
    end
    it 'raises an error if a plane already landed tries to land again' do
      allow(airport).to receive(:bad_weather?).and_return(false)
      allow(airport).to receive(:at_airport?).with(plane).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Sorry: this plane has already landed.'
    end
  end

  describe '#take_off' do
    it 'raises and error if the weather is stormy' do
      allow(airport).to receive(:at_airport?).with(plane).and_return(true)
      allow(airport).to receive(:bad_weather?).and_return true
      expect { airport.take_off(plane) }.to raise_error 'The weather is stormy'
    end

    it 'raises an error if plane not in airport' do
      allow(airport).to receive(:bad_weather?).and_return false
      allow(airport).to receive(:at_airport?).with(plane).and_return(false)
      expect { airport.take_off(plane) }.to raise_error 'Plane not in this airport'
    end
  end

  describe '#plane' do
    it 'should return an array' do
      expect(airport.plane).to eq(Array.new)
    end
  end
end
