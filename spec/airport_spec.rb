require 'airport'

describe Airport do

  let(:airport) { Airport.new }

  describe "#land" do

    it "responds to land method with 1 argument" do
    expect(airport).to respond_to(:land).with(1).argument
    end

  end

  describe "#confirm_landed" do

    it "responds to confirm_landed method with 1 argument" do
    expect(airport).to respond_to(:confirm_landed).with(1).argument

    end

  end

end