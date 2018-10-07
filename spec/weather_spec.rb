require 'rspec'
require_relative '../weather'

describe Weather do
  subject(:weather){described_class.new}
  describe 'new' do
    it 'should create a new weather object' do
      expect(described_class).to eq(Weather)
    end
  end

end