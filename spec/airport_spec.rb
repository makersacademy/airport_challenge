require 'rspec'
require_relative '../airport'
require_relative '../plane'
require_relative '../weather'

describe Airport do
  subject(:airport){described_class.new}
  describe '#new' do
    it 'should create a new airport object' do
      expect(described_class).to eq(Airport)
    end
  end
  describe '#land_plane' do

  end
  describe '#takeoff_plane' do

  end

end