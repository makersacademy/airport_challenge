require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#instruct_landing' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:instruct_landing).with(1).argument
    end
  end
  describe '#instruct_take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:instruct_take_off).with(1).argument
    end
  end
end
