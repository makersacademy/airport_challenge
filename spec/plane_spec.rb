require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#initialize' do
    it 'creates a plane with a default status: landed' do
      expect(plane).to be_docked
    end
  end

  it 'can change its status to landed' do
    plane.land
    expect(plane).to be_docked
  end
  it 'can change its status to airborne' do
    plane.take_off
    expect(plane).not_to be_docked
  end
end
