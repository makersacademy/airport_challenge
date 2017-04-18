require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { double :airport}

  describe 'respond and initiate' do
    it "responds to a method"do
      expect(plane).to respond_to(:land).with(1).argument
      expect(plane).to respond_to(:depart)
    end

    it "can initialize a new plane" do
      expect(plane).to be_a(Plane)
    end

  end

  describe '#land' do

    it 'record the airport plane landed at' do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end

    it 'raises an error if already landed' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error "Plane can not land as it is already on the ground"
    end

  end

  describe '#depart' do
    it 'raises an error if already departed' do
      plane.depart
      expect { plane.depart }.to raise_error "Plane can not depart as it has already departed"
    end
  end

end
