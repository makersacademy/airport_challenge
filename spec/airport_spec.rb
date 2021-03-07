require 'airport'

describe Airport do
  alias_method :test_airport, :subject
  let(:plane1) { double "plane" }
  let(:weather) { double "weather" }

  it 'responds to a request to allow a user to set the capacity' do
    expect(test_airport).to respond_to(:capacity)
  end
  it 'responds to a question of whether it is stormy' do
    expect(test_airport).to respond_to(:stormy?)
  end
  
  describe 'Planes landing at the airport.' do
    it 'Airport responds to a request for a plane to land.' do
      allow(test_airport).to receive(:stormy?) { false }
      expect(test_airport).to respond_to(:land)
    end
    it "Airport won't let a plane land if the airport is full." do
      allow(plane1).to receive(:location) {"In the air"}
      allow(plane1).to receive(:change_location).with("airport")
      allow(test_airport).to receive(:stormy?) { false }
      allow(test_airport).to receive(:plane?).with(plane1) { false }
      Airport::DEFAULT_CAPACITY.times { test_airport.land(plane1) }
      expect { test_airport.land(plane1) }.to raise_error "Airport Full"
    end
    it "won't let a plane land if the weather is stormy" do
      allow(test_airport).to receive(:stormy?) { true }
      allow(plane1).to receive(:location) {"In the air"}
      expect { test_airport.land(plane1) }.to raise_error "Weather stormy; plane cannot land"
    end
    it "allows a plane to land if the weather is sunny" do
      allow(test_airport).to receive(:stormy?) { false }
      allow(plane1).to receive(:location) {"In the air"}
      allow(plane1).to receive(:change_location).with("airport")
      test_airport.land(plane1)
      expect(test_airport.plane_list).to eq [plane1]
    end
    it "won't allow a plane to land if it isn't in the air" do
      allow(test_airport).to receive(:stormy?) { false }
      allow(test_airport).to receive(:plane?).with(plane1) { false }
      allow(plane1).to receive(:location) {"A different airport"}
      expect { test_airport.land(plane1) }.to raise_error "Plane can't land if it isn't flying"
    end
    it "won't allow a plane to land if it is already in the airport" do
      allow(test_airport).to receive(:stormy?) { false }
      allow(test_airport).to receive(:plane?).with(plane1) { true }
      expect { test_airport.land(plane1) }.to raise_error "Plane already in airport"
    end
  end

  describe 'knows what planes are at the airport.' do
    it 'Airport responds to a request to share its plane list' do
      expect(test_airport).to respond_to(:plane_list)
    end
    it 'responds to a question of whether it has a plane' do
      expect(test_airport).to respond_to(:plane?).with(1).argument
    end
    it 'Airport includes a plane in its plane list after landing' do
      allow(plane1).to receive(:location) {"In the air"}
      allow(plane1).to receive(:change_location).with("airport")
      allow(test_airport).to receive(:stormy?) { false }
      test_airport.land(plane1)
      expect(test_airport.plane_list).to eq [plane1]
    end
    it 'Airport no longer includes a plane in its plane list if the plane has taken off' do
      allow(plane1).to receive(:change_location).with("airport")
      allow(plane1).to receive(:change_location).with("In the air")
      allow(plane1).to receive(:location) {"In the air"}
      allow(test_airport).to receive(:stormy?) { false }
      test_airport.land(plane1)
      allow(plane1).to receive(:location) {"airport"}
      test_airport.take_off(plane1)
      expect(test_airport.plane_list).to eq []
    end
    it 'Knows it has a plane in its airport' do
      allow(plane1).to receive(:location) {"In the air"}
      allow(plane1).to receive(:change_location).with("airport")
      allow(test_airport).to receive(:stormy?) { false }
      test_airport.land(plane1)
      expect(test_airport.plane?(plane1)).to eq true
    end
    it 'responds to a question of whether it is full' do
      expect(test_airport).to respond_to(:full?)
    end
  end


  describe 'Planes taking off from the airport.' do
    it 'responds to a request for a plane to take off' do
      expect(test_airport).to respond_to(:take_off).with(1).argument
    end
    it "won't let a plane take off if it is already in the air" do
      allow(test_airport).to receive(:stormy?) { false }
      allow(plane1).to receive(:location) {"In the air"}
      expect{test_airport.take_off(plane1)}.to raise_error "Plane is already in the air"
    end
    it "won't let a plane take off if the weather is stormy" do
      allow(test_airport).to receive(:stormy?) { true }
      allow(plane1).to receive(:location) {"airport"}
      expect { test_airport.take_off(plane1) }.to raise_error "Weather stormy; plane cannot take off"
    end
    it "won't allow a plane to take off if it isn't in the airport" do
      allow(test_airport).to receive(:plane?) { false }
      allow(test_airport).to receive(:stormy?) { false }
      allow(plane1).to receive(:location) {"A different airport"}
      expect { test_airport.take_off(plane1) }.to raise_error "Plane isn't in airport"
    end
  end
end
