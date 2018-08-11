require "airport"

describe Airport do
  # let mocking functions can go there e.g. ...
  # let(:mockWeather)  { double :weather, good?: true}
  describe "when first initialized"
    it { is_expected.not_to eql(nil) }

end
