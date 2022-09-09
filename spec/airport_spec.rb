require 'airport'

describe Airport do
  
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it { is_expected.to be_kind_of Airport }

  describe '#land_plane' do
    it 'allows plane to land in airport' do   
      airport.current_weather = 'sunny'
      
      expect(airport.land_plane).to be_kind_of Plane
    end

    it 'does not allow planes to land when airport is full' do
      airport.current_weather = 'sunny'
      airport.capacity.times { airport.land_plane }

      expect { airport.land_plane }.to raise_error('Airport is full')
    end

    it 'does not allow plane to land in airport when stormy' do
      airport.current_weather = 'stormy'

      expect { airport.land_plane }.to raise_error('Cannot fly when there is a storm')
    end
  end

  describe '#take_off' do
    context "when 'plane' is in 'planes_in_airport'" do
      before(:each) { airport.planes_in_airport = [plane] } 

      it 'does not let planes take off when stormy' do
        airport.current_weather = 'stormy'

        expect { airport.take_off(plane) }.to raise_error('Cannot fly when there is a storm')
      end
      
      context 'when the weather is sunny' do
        before(:each) { allow(airport).to receive(:check_for_storm).and_return(nil) }

        it 'allows plane to leave airport' do
          expect(airport.take_off(plane)).to eq plane
        end

        it 'removes plane from airport' do
          airport.take_off(plane)

          expect(airport.planes_in_airport).to eq([])
        end
      end
    end
  end

  describe '#def_capacity' do
    it 'allows you to change the capacity of the airport' do
      airport.def_capacity(20)
      
      expect(airport.capacity).to eq(20)
    end
  end

  describe '#check_weather' do
    it 'reports what if the weather is sunny or stormy' do
      expect(airport.check_weather).to eq('sunny').or eq('stormy')
    end
  end
end
