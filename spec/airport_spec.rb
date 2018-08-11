require "airport"

describe Airport do
  # let mocking functions can go there e.g. ...
  # let(:mockWeather)  { double :weather, good?: true}
  
  it "iniatializes" do
    expect(Airport.new).not_to eql(nil)
  end

  describe "#land"
  it "responds to land method" do
    expect(subject).to respond_to(:land)
  end

  it "takes 1 argument" do
    expect(subject).to respond_to(:land).with(1).arguments
  end


end
