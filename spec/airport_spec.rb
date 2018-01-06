require_relative "../lib/airport.rb"

describe Airport do 
   
  describe "#land" do
   
    it { is_expected.to respond_to(:land) }

  end

end
