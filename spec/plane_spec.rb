require 'plane'

describe Plane do
  let(:plane) { Plane.new('Boeing') }

  describe '#initialize' do
    it 'Has a landed status' do
      expect(plane).not_to be_landed
    end

    it 'Creating a new plane should save the model' do
      expect(plane.model).to eq 'Boeing'
    end
  end

  it 'Landing change the plane status' do
    plane.landing
    expect(plane).to be_landed
  end

  it 'Taking off change the plane status' do
    plane.landing
    plane.taking_off
    expect(plane).not_to be_landed
  end
end
