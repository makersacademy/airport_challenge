# This spec tests the plane class in plain.rb
require 'plane'

describe Plane do

  describe '#landing procedures' do
    it { is_expected.to respond_to :landed }

    it 'is landed at specific airport' do
      expect(subject.landed Airport.new).to eq true
    end

    it 'is not landed at specific airport' do
      expect(subject.landed Weather.new).to eq false
    end

    it 'is not landed at specific airport test 2' do
      airport = []
      expect(subject.landed airport).to eq false
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :flying }
  end

end
