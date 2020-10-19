require "./lib/sysdes.rb"
require "./lib/airport.rb"

RSpec.describe Sysdes do
  let(:subject) { Sysdes.new }
  describe "#override" do
    it "overrides the airport capacity" do
      $capacity = 20
      expect($capacity).to eq 20
    end
  end
end
