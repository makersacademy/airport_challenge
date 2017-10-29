require 'whether'

describe Whether do
  subject(:new_whether) { described_class.new }
  let(:storm) { WhetherStormy.new }
  let(:whether) { WhetherClear.new }

  describe 'initialize' do
    it 'should create a random number with a new instance of whether' do
      expect(new_whether.random_number).to be_instance_of(Integer)
    end
  end

  describe 'there_a_storm?' do
    it 'should return true if random_number eq 0' do
      expect(new_whether.there_a_storm?(0)).to eq(true)
    end

    it 'should return flase if random_number not 0' do
      expect(new_whether.there_a_storm?(2)).to eq(false)
    end
  end
end
