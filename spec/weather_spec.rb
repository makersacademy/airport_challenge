require 'weather'

describe Weather do
  subject(:dummy_class) {Class.new{include Weather}.new}
  # Idea taken from http://stackoverflow.com/questions/1542945/testing-modules-in-rspec

  it{is_expected.to respond_to(:sunny?)}

  context '.sunny? is able to randomly return both true and false' do

    def test_weather
      counter = 0
      loop do
        break if subject.sunny?
        return '.sunny? was not able to randomly set the weather' if counter > 100_000 # sanity check to prevent infinite loops
        counter += 1
      end
      loop do
        break unless subject.sunny?
        return '.sunny? was not able to randomly set the weather' if counter > 100_000 # sanity check to prevent infinite loops
        counter += 1
      end
      ".sunny was successfully able to set the weather randomly"
    end

    it 'is able to return both true and false' do
      expect(test_weather).to eq '.sunny was successfully able to set the weather randomly'
    end

  end
end
