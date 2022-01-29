require_relative '../lib/airport'

describe Airport do


  let(:plane) { double(:plane) }
  let(:weather) { double(:weather, :stormy? => false) }

  subject(:airport) { described_class.new(weather) }

  before(:each) do
    allow(plane).to receive(:land).and_return(plane)
    allow(plane).to receive(:take_off).and_return(plane)
  end

  describe 'initialization' do

    before(:each) do
      allow(plane).to receive(:flying?).and_return(true)
    end

    it 'default capacity of airport' do
      described_class::DEFAULT_CAPACITY.times do
        airport.land(plane)
      end 
      expect { airport.land(plane) }.to raise_error 'Airport at full capacity.'
    end

    it 'prevents a non default capacity being exceeded' do
      non_default_capacity_airport = described_class.new(weather, 10)
      10.times do
        non_default_capacity_airport.land(plane)
      end  
      expect { non_default_capacity_airport.land(plane) }.to raise_error 'Airport at full capacity.'
    end

  end

  describe "#take_off" do
    let(:plane_one) {double(:plane)}
    let(:plane_two) {double(:plane)}
    let(:plane_three) {double(:plane)}

    before(:each) do
      allow(plane_one).to receive(:land).and_return(plane_one)
      allow(plane_two).to receive(:land).and_return(plane_two)
      allow(plane_three).to receive(:land).and_return(plane_one)
      allow(plane_two).to receive(:take_off).and_return(plane_two)

    end
 
    it "confirms that the plane is no longer in the airport after take off" do
      airport.land (plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error 'Plane not at airport'
    end

    it "confirms that the plane if it is in another airport it can not take off from a different airport" do

      other_airport = described_class.new(weather)
      other_airport.land(plane)

      expect { airport.take_off(plane) }.to raise_error 'Plane not at airport'
    end

    it "confirms that a specific plane can take off from the airport" do
      airport.land(plane_one)
      airport.land(plane_two)
      airport.land(plane_three)

      expect(airport.take_off(plane_two)).to be(plane_two) 
    end

  end 

  describe "#land" do

    it "confirms that the plane has landed at the airport" do
      expect { airport.land (plane) }.not_to raise_error
    end

  end 

  context "stormy weather" do
    let(:stormy_weather) { double(:weather, :stormy? => true) }

    describe "#take_off" do
      it "prevents takeoff if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.take_off(plane) }.to raise_error 'Weather is stormy.'
      end
    end

    describe "#land" do
      it "prevents landing if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.land(plane) }.to raise_error 'Weather is stormy.'
      end
    end
  end

end
