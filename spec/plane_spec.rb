require 'plane'

RSpec.describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double(:airport) }

  it 'creates an instance of plane' do
    expect(plane).not_to eq(nil)
  end

  describe 'landings at the airport' do

    it { is_expected.to respond_to :land_at }

    it 'does not land a plane if airport is full' do 
      allow(airport).to receive(:full) { true } 
      allow(plane).to receive(:weather_ok?) { true }

      expect { plane.land_at(airport) }.to raise_error "Unable to land, the airport is full!"
    end

    it 'does not land if the weather is "stormy"' do
      allow(airport).to receive_messages(full: false, garage: nil)
      
      allow(plane).to receive(:weather_ok?) { false } 

      expect {plane.land_at(airport)}.to raise_error "The weather is too 'stormy' to land!"
    end
  end

  describe 'takes off from the airport' do

    it 'confirms that the plane is not inside an airport' do
        allow(airport).to receive_messages(full: false, garage: nil, au_revoir: nil)
        allow(plane).to receive(:weather_ok?) { true }
        plane.land_at(airport)
        plane.take_off

        expect(plane.status).to eq("flying")
    end

    it 'does not take off if the weather is "stormy"' do
      allow(airport).to receive_messages(full: false, garage: nil, au_revoir: nil)
      allow(plane).to receive(:weather_ok?) { true } 

      plane.land_at(airport)
      allow(plane).to receive(:weather_ok?) { false } 

      expect {plane.take_off}.to raise_error "The weather is too stormy to fly!"
    end
  end

end