require 'weather'

describe Weather do
  subject(:dummy_class) {Class.new{include Weather}.new}
  # Idea taken from:
  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec

  it{is_expected.to respond_to(:sunny?)}

  context '.sunny? is able to randomly return both true and false' do

    def test_weather
      counter = 0
      message = 'unable to randomize weather'
      loop do
        break if subject.sunny?
        return message if counter > 100_000
        counter += 1
      end
      loop do
        break unless subject.sunny?
        return message if counter > 100_000
        counter += 1
      end
      'successfully randomized weather'
    end

    it 'is able to return both true and false' do
      expect(test_weather).to eq 'successfully randomized weather'
    end

  end
end
