require 'airport'

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane)             { double("Plane", :land => :landed) }
  let(:sunny_weather)     { allow_any_instance_of(Airport).to receive(:weather).and_return('sunny') }
  let(:stormy_weather)    { allow(airport).to receive(:weather).and_return('stormy') }

  # EXPECTED ERROR MESSAGES
  let(:airport_full)      { 'Airport is at capacity' }
  let(:plane_not_here)    { 'Plane is not at this airport' }
  let(:stormy_error)      { 'Weather is stormy and too unsafe' }

  def full_airport(capacity)
    sunny_weather
    plane = double("Plane", :land => :landed)
    airport = Airport.new(capacity)
    capacity.times { airport.clear_landing(plane) }
    airport
  end

  describe '#clear_landing(plane)' do
    it { should respond_to(:clear_landing).with(1).argument }

    context 'airport has capacity' do
      context 'weather is sunny' do
        before do
          sunny_weather
        end

        it 'sends a request to the plane to land' do
          expect(plane).to receive(:land).once.with(no_args)
          airport.clear_landing(plane)
        end

        it 'stores the plane if plane has landed' do
          airport.clear_landing(plane)
          expect(airport.has_plane?(plane)).to eq true
        end

        it "doesn't store plane if the plane throws an error" do
          allow(plane).to receive(:land).and_raise('Plane is already landed')
          expect { airport.clear_landing(plane) }.to raise_error(RuntimeError)
          expect { airport.clear_landing(plane) rescue nil }.not_to change(airport, :planes)
        end
      end

      context 'weather is stormy' do
        it 'raises an error and retains plane at airport' do
          stormy_weather
          expect { airport.clear_landing(plane) }.to raise_error(stormy_error)
        end
      end
    end

    context 'airport is full with default capacity' do
      it "raises error and doesn't store plane" do
        airport = full_airport(Airport::DEFAULT_CAPACITY)

        expect { airport.clear_landing(plane) }.to raise_error(airport_full)
        expect(airport.has_plane?(plane)).to eq false
      end
    end

    context 'airport is full with lower capacity set' do
      it 'limits planes to the lower capacity' do
        small_airport = full_airport(Airport::DEFAULT_CAPACITY / 5)

        expect { small_airport.clear_landing(plane) }.to raise_error(airport_full)
        expect(small_airport.has_plane?(plane)).to eq false
      end
    end

    context 'airport is full with higher capacity set' do
      it 'limits planes at the higher capacity' do
        large_airport = full_airport(Airport::DEFAULT_CAPACITY * 2)

        expect { large_airport.clear_landing(plane) }.to raise_error(airport_full)
        expect(large_airport.has_plane?(plane)).to eq false
      end
    end
  end

  describe '#clear_takeoff(plane)' do
    it { should respond_to(:clear_takeoff).with(1).argument }

    context 'plane is at the airport' do
      before do
        sunny_weather
        airport.clear_landing(plane)
      end

      context 'weather is sunny' do
        before do
          sunny_weather
        end

        it 'clears takeoff and releases plane' do
          airport.clear_takeoff(plane)
          expect(airport.has_plane?(plane)).to eq false
        end
      end

      context 'weather is stormy' do
        before do
          stormy_weather
        end

        it 'raises an error and retains plane at airport' do
          expect { airport.clear_takeoff(plane) }.to raise_error(stormy_error)
          expect(airport.has_plane?(plane)).to eq true
        end
      end
    end

    context 'plane is not at the airport' do
      it 'raises an error' do
        expect { airport.clear_takeoff(plane) }.to raise_error(plane_not_here)
      end
    end
  end
end
