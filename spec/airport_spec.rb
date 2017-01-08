require "airport.rb"

describe Airport do

  describe ".new" do
    it "takes an argument" do
      expect{Airport.new("Paris")}.not_to raise_error
    end
  end

  subject(:airport) { Airport.new("Paris") }
  it { is_expected.to respond_to(:airport_name) }


end
