# require 'simplecov'
# require 'simplecov-console'
require 'airport'

describe 'Airport' do
  describe '#land' do
    it 'responds to method #land' do
      expect(Airport.new).to respond_to :land
    end
  end
end
