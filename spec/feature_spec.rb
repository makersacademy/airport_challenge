require 'airport'
require 'weather'
require 'plane'

describe 'Airport Challenge' do

  let(:heathrow) { Airport.new }
  let(:gatwick) { Airport.new }
  let(:sydney) { Airport.new(2) }

  let(:sunny_weather)     { allow_any_instance_of(Airport).to receive(:weather).and_return('sunny') }
  let(:stormy_weather)    { allow(airport).to receive(:weather).and_return('stormy') }

  def full_airport(capacity)
    sunny_weather
    airport = Airport.new(capacity)
    capacity.times { airport.create_plane }
    airport
  end

  context 'when the weather is sunny' do
    before do
      sunny_weather

      # Create plane QF1 in Sydney
      @qf1 = sydney.create_plane
      @ba0016 = sydney.create_plane
    end

    it 'allows a plane to fly between airports' do
      # Flight QF1 takes off from Sydney
      sydney.clear_takeoff(@qf1)

      expect(@qf1.status).to eq(:airborne)

      # and lands at Heathrow
      heathrow.clear_landing(@qf1)

      expect(@qf1.status).to eq(:landed)
      expect(heathrow.has_plane?(@qf1)).to eq true
      expect(sydney.has_plane?(@qf1)).to eq false

      # Flight QF1 then takes off from Heathrow
      heathrow.clear_takeoff(@qf1)

      expect(@qf1.status).to eq(:airborne)

      # and lands at Gatwick
      gatwick.clear_landing(@qf1)

      expect(@qf1.status).to eq(:landed)
      expect(gatwick.has_plane?(@qf1)).to eq true
      expect(heathrow.has_plane?(@qf1)).to eq false
    end

    it 'allows multiple planes to land at an airport (that has capacity)' do
      # Both QF1 and BA0016 fly from Sydney to Gatwick
      [@qf1, @ba0016].each do |plane|
        sydney.clear_takeoff(plane)
        gatwick.clear_landing(plane)
      end

      expect(gatwick.has_plane?(@qf1)).to eq true
      expect(gatwick.has_plane?(@ba0016)).to eq true
    end

    it "prevents planes from taking off from an airport they aren't at" do
      # Attempt to clear QF1 for takeoff from Heathrow
      expect { heathrow.clear_takeoff(@qf1) }.to raise_error(RuntimeError)
    end

    it 'prevents planes from landing at an airport that is full' do
      luton = full_airport(3)

      expect { luton.clear_landing(@qf1) }.to raise_error(RuntimeError)
    end
  end
end
