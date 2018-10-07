require 'rspec'
require_relative '../airport'

describe Airport do
  subject(:airport){described_class.new}
  describe 'new' do
    it 'should create a new airport object' do
      expect(described_class).to eq(Airport)
    end
  end

end