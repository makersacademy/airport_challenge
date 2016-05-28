require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe "#stormy?" do
    it "responds to stormy? method" do
    expect(weather).to respond_to(:stormy?)
    end
  end
end