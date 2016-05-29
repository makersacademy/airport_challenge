require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe 'respond and initiate' do
    it "responds to a method"do
      expect(plane).to respond_to(:land)
      expect(plane).to respond_to(:depart)
    end

    it "can initialize a new plane" do
      expect(plane).to be_a(Plane)
    end

  end

  describe '#land' do
    it 'raises an error if already landed' do
      plane.land
      expect { plane.land }.to raise_error "Plane can not land as it is already on the ground"
    end
  end

  describe '#depart' do
    it 'raises an error if already departed' do
      plane.depart
      expect { plane.depart }.to raise_error "Plane can not depart as it has already departed"
    end
  end

end
