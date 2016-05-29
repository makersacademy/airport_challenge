require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  context 'initializing a plane' do
    
    it 'ensures new planes are created in the air' do
      expect(subject.location).to eq(nil)
    end

  end

  context 'when landing' do
    
    it 'responds to the #land method' do
      expect(subject).to respond_to(:land)
    end

    it 'returns confirmation of successful landing, and switches status to landed position' do
      allow(airport).to receive(:accept_landing) {true}
      expect(subject.land(airport)).to eq("Plane landed at #{airport}.")
      expect(subject.on_ground).to eq(true)
      expect(subject.location).to eq(airport)
    end

    it 'will not attempt to land if already landed' do
      allow(airport).to receive(:accept_landing) {true}
      subject.land(airport)
      expect(subject.land(airport)).to eq("Plane is already on the ground!")
    end

    it 'obtains permission from airport prior to landing' do
      allow(airport).to receive(:accept_landing) {"Airport already at capacity"}
      expect(Plane.new.land(airport)).to eq("Unable to land. Message from airport: Airport already at capacity")
    end

  end

  context 'when taking off' do

    it 'responds to the #take_off method' do
      expect(subject).to respond_to(:take_off)
    end

    it 'returns confirmation of successful take-off, and switches status to in the air' do
      allow(airport).to receive(:accept_landing) {true}
      subject.land(airport)
      allow(airport).to receive(:allow_take_off) {true}
      expect(subject.take_off(airport)).to eq("Plane took off from #{airport}.")
      expect(subject.on_ground).to eq(false)
      expect(subject.location).to eq(nil)    
    end

    it 'will not attempt to take-off if already in the air' do
      expect(subject.take_off(airport)).to eq("Plane is already in the air!")
    end

    it 'obtains permission from airport prior to taking off' do
      allow(airport).to receive(:accept_landing) {true}
      subject.land(airport)
      allow(airport).to receive(:allow_take_off) {"Weather too stormy"}
      expect(subject.take_off(airport)).to eq("Unable to take off. Message from airport: Weather too stormy")
    end

  end

end