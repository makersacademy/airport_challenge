require 'system_designer.rb'

describe SystemEngineer do
  describe "#override_capacity" do
    it "overrides the maximum capacity for the airport" do
      sd = SystemEngineer.new
      expect(sd.override_capacity).to eq("the airport capacity can be overridden")
    end
  end
end
