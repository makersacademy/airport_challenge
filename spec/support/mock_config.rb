
module MockConfig
  RSpec.shared_context "airport mock config", :shared_context => :metadata do

    let(:plane) { double(:plane) }
    let(:weather) { double(:weather, :stormy? => false) }
    let(:stormy_weather) { double(:weather, :stormy? => true) }
    
    subject(:airport) { described_class.new(weather) }
  
    let(:plane_one) { double(:plane) }
    let(:plane_two) { double(:plane) }
    let(:plane_three) { double(:plane) }

    def land_three_planes(plane_one, plane_two, plane_three)
      airport.land(plane_one)
      airport.land(plane_two)
      airport.land(plane_three)
    end
    
  end

  RSpec.shared_context "plane mock config", :shared_context => :metadata do

    subject(:plane) { described_class.new } 

  end

  RSpec.shared_context "weather mock config", :shared_context => :metadata do

    let(:weather) { described_class.new }

  end

end
