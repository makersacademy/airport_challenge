require 'airport'
require 'weather'
require 'plane'
require 'airport_spec'

describe 'Airport Challenge' do

  let(:heathrow) { Airport.new }
  let(:gatwick) { Airport.new }
  let(:sydney) { Airport.new(2) }

  let(:sunny_weather)     { allow_any_instance_of(Airport).to receive(:weather).and_return('sunny') }
  let(:stormy_gatwick)    { allow(gatwick).to receive(:weather).and_return('stormy') }

  before do
    sunny_weather

    # Create plane QF1 in Sydney
    @qf1 = sydney.create_plane
    @ba0016 = sydney.create_plane
  end

  it "allows a plane to fly between airports as long as it's not stormy" do
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
    expect(heathrow.has_plane?(@qf1)).to eq false

    # but the weather becomes stormy and QF1 should not be able to land at Gatwick
    stormy_gatwick

    expect { gatwick.clear_landing(@qf1) }.to raise_error(RuntimeError)

    # so QF1 is redirected back to Heathrow
    heathrow.clear_landing(@qf1)

    expect(heathrow.has_plane?(@qf1)).to eq true
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
end
