require 'rspec'
require_relative '../plane'

describe Plane do
  before(:each) do
    @plane = Plane.new
    @plane2 = Plane.new(true)
  end

  describe '#new' do
    it 'should create a new plane object' do
      expect(described_class).to eq(Plane)
    end

    it 'should set the landed state to false by default' do
      expect(@plane.landed).to eq(false)
    end
  end
  describe '#land' do
    describe 'with landed equal to false' do
      it 'should return true' do
        expect(@plane.land).to eq(true)
      end
    end
    describe 'with landed equal to true' do
      it 'should return false' do
        expect(@plane2.land).to eq(false)
      end
    end
  end

  describe '#takeoff' do
    describe 'with landed equal to true' do
      it 'should return true' do
        expect(@plane2.takeoff).to eq(true)
      end
    end
    describe 'with landed equal to false' do
      it 'should return false' do
        expect(@plane.takeoff).to eq(false)
      end
    end
  end
end