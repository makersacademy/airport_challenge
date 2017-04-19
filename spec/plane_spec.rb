require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:weather) { double :weather }
  let(:airport) { double :airport }

  describe "#land" do

    before do
      allow(airport).to receive_messages(:planes => [], :full? => false, :receive => [])
      allow(weather).to receive_messages(:status => :sunny)
    end

    it "possible in sunny weather" do
      expect { plane.land(weather, airport) }.not_to raise_error
    end

    it 'impossible in stormy weather' do
      allow(weather).to receive_messages(:status => :stormy)
      message = "Cannot land in stormy weather"
      expect { plane.land(weather, airport) }.to raise_error message
    end

    it "impossible if plane has landed" do
      plane.land(weather, airport)
      message = "I have already landed"
      expect { plane.land(weather, airport) }.to raise_error message
    end

  end

  describe "#take_off" do

    before do
      allow(airport).to receive_messages(:planes => [], :full? => false, :receive => [], :release => plane)
      allow(weather).to receive_messages(:status => :sunny)
    end

    it 'possible in sunny weather' do
      expect { plane.take_off(weather, airport) }.not_to raise_error
    end

    it 'impossible in stormy weather' do
      allow(weather).to receive_messages(:status => :stormy)
      message = "Cannot land in stormy weather"
      expect { plane.land(weather, airport) }.to raise_error message
    end

    it "impossible if plane already in-flight" do
      plane.land(weather, airport)
      plane.take_off(weather, airport)
      message = "I am already in the air"
      expect { plane.take_off(weather, airport) }.to raise_error message
    end

  end

  describe "#confirm_status" do

    before do
      allow(weather).to receive_messages(:status => :sunny)
      allow(airport).to receive_messages(:full? => false, :receive => [], :release => plane)
    end

    it 'correctly reports if a plane has landed' do
      plane.land(weather, airport)
      expect(plane.confirm_status).to eq :landed
    end

    it 'correctly reports if a plane has taken off' do
      plane.take_off(weather, airport)
      expect(plane.confirm_status).to eq :in_air
    end

  end

end
