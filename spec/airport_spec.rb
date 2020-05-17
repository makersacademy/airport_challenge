require 'airport'
require 'plane'

describe 'Airport' do
  it 'Create an instance of the class Airport' do
    expect(Airport.new).to be_instance_of Airport
  end
  context 'Land method' do
    it 'Airport responds to a land method' do
      expect(Airport.new).to respond_to(:land)
    end
  end
  context 'Plane landed' do
    it 'Test message back after land' do
      expect(Airport.new.land(Plane.new)).to eq "Plane Landed"
    end
  end
  context 'Take off method' do
    it 'Airport respond to a take_off method ' do
      expect(Airport.new).to respond_to(:take_off)
    end
  end
  context 'Plane take_off' do
    it 'Test message after take_off' do
      expect(Airport.new.take_off).to eq "Plane no more in the Airport"
    end
  end
end

describe 'Plane' do
  it 'Create an instance of the class Plane' do
    expect(Plane.new).to be_instance_of Plane
  end
end
