require 'whether'

class WhetherStormy
  attr_reader :random_number

  def initialize
    @random_number = 0
  end

  def there_a_storm?
    answer = true if @random_number == 0
    answer = false if @random_number != 0
    answer
  end
end

class WhetherClear
  attr_reader :random_number

  def initialize
    @random_number = 2
  end

  def there_a_storm?
    answer = true if @random_number == 0
    answer = false if @random_number != 0
    answer
  end
end

describe Whether do
  let(:new_whether) { Whether.new }

  it 'should respond true if there is a storm' do
    storm = WhetherStormy.new
    expect(storm.there_a_storm?).to eq(true)
  end

  it 'should respond false if there is not a storm' do
    whether = WhetherClear.new
    expect(whether.there_a_storm?).to eq(false)
  end

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
