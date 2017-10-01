require 'airport'

  describe Airport do

  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  context 'when weather is good' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:instruct_plane_to_land).with(1).argument
    end

    it 'instructs a plane to land and increases the planes array by 1' do
      expect { airport.instruct_plane_to_land(plane) }.to change { airport.plane_count }.by(1)
    end

    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:instruct_plane_to_take_off)
    end

    it 'confirms that the plane is no longer in the airport' do
      airport.planes << plane
      expect { airport.instruct_plane_to_take_off(plane) }.to change { airport.plane_count }.by(-1)
    end
  end

  context 'when weather is bad' do
    before do
      allow(airport).to receive(:stormy?).and_return(true)
    end

    it 'prevents take off when weather is stormy' do
      expect { airport.instruct_plane_to_take_off(plane) }.to raise_error("plane cannot take off in stormy weather")
    end

    it 'prevents landing when weather is stormy' do
      expect { airport.instruct_plane_to_land(plane) }.to raise_error("plane cannot land in stormy weather")
    end
  end
  end
