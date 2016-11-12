require 'airport'

describe Airport do

  subject(:airport) {described_class.new}

  it 'responds to land method' do
    expect(airport).to respond_to(:land)
  end

  describe '#land' do

    it 'takes a plane as an argument' do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end
end
