require 'weather'

describe Weather do

  it { should respond_to(:set_weather) }

  describe "#set_weather" do

    it "Should either return true or false" do
      expect(subject.set_weather).to be(true).or be(false)
    end

  end

end
