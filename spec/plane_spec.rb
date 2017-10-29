require 'plane'

describe Plane do

  subject(:plane) { Plane.new }
  subject(:grounded_plane) { Plane.new(:ground, airport) }

  let(:airport) { double('airport') }

  describe 'plane has adequate status information' do
    it 'initializes with status set to flying by default' do
      expect(plane.status).to eq :flying
    end

    before do
      allow(airport).to receive(:request) { true }
    end

    it 'changes status to ground after landing' do
      plane.land(airport)
      expect(plane.status).to eq :ground
    end

    it 'changes status to flying after take off' do
      grounded_plane.take_off(airport)
      expect(grounded_plane.status).to eq :flying
    end
  end

  describe 'plane has adequate airport information' do
    it 'initializes with airport set to nil' do
      expect(plane.current_airport).to eq nil
    end

    before do
      allow(airport).to receive(:request) { true }
    end

    it 'registers current airport after landing' do
      plane.land(airport)
      expect(plane.current_airport).to eq airport
    end

    it 'changes back to nil after take off' do
      grounded_plane.take_off(airport)
      expect(grounded_plane.current_airport).to eq nil
    end
  end

  describe 'wrong requests to planes' do
    it 'rejects request to land when on ground' do
      test_plane = grounded_plane
      grounded_plane.land(airport)
      expect(grounded_plane).to eq test_plane
    end

    it 'rejects request to take_off when flying' do
      test_plane = plane
      plane.take_off(airport)
      expect(plane).to eq test_plane
    end

    it 'prints message when requested to land while on ground' do
      message = "This plane is currently on the ground.\n"
      expect { grounded_plane.land(airport) }.to output(message).to_stdout  
    end

    it 'prints message when requested to take off while flying' do
      message = "This plane is currently flying.\n"
      expect { plane.take_off(airport) }.to output(message).to_stdout  
    end
  end

end
