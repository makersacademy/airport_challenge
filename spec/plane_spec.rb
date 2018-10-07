require 'rspec'
require_relative '../plane'

describe Plane do
  subject(:plane){described_class.new}
  describe 'new' do
    it 'should create a new plane object' do
      expect(described_class).to eq(Plane)
    end
  end

end