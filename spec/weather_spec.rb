require 'weather'

describe Weather do
  subject(:dummy_class) {Class.new{include Weather}.new}
  # Since I decided to make Weather a module (see Project-README.md for explication), I need to setup an instance of a testing class that has access to this module. Idea taken from http://stackoverflow.com/questions/1542945/testing-modules-in-rspec

  it{is_expected.to respond_to(:sunny?)}
    # Weather should have a .sunny? method

  context '.sunny? is able to randomly return both true and false' do

    def test_weather
      counter = 0
      loop do
        break if subject.sunny?
        return '.sunny? was not able to randomly set the weather' if counter > 100000 # sanity check to prevent infinite loops
        counter += 1
      end
      loop do
        break if not subject.sunny?
        return '.sunny? was not able to randomly set the weather' if counter > 100000 # sanity check to prevent infinite loops
        counter += 1
      end
      ".sunny was successfully able to set the weather randomly"
    end
    # This method runs two loops until .sunny? returns the true and false once each, thus ensuring that .sunny? has the ability to return both.

    it 'is able to return true (weather is sunny)' do
      expect(test_weather).to eq '.sunny was successfully able to set the weather randomly'
    end

end
end
