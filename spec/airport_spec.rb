require "airport"

describe AirtrafficController do
  it "will respond to land method" do
    expect(subject).to respond_to(:land)
  end
end
