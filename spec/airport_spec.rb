require 'simplecov'
SimpleCov.start
require 'airport'

describe Airport do
  let(:airport_good) { Airport.new }
  let(:airport_bad) { Airport.new }
  let(:river_hudson) { Airport.new(0) }
  let(:plane) { double :plane }
  let(:heli) { double :heli }
  let(:weather) { double :weather }

  before(:example) do
    allow(plane).to receive(:final_approach)
    allow(heli).to receive(:final_approach)
    allow(plane).to receive(:takeoff)
  end

  context ' take off/landing tests: ' do
    it 'should be able to land a plane at airport' do
      allow(airport_good).to receive(:stormy?).and_return(false)
      expect(airport_good).to respond_to(:land).with(1).arguments
    end
    it 'should be able to launch a plane' do
      expect(airport_good).to respond_to(:launch).with(1).arguments
    end
    it 'plane should no longer be in airport after launching' do
      allow(plane).to receive(:airborne).and_return(true)
      allow(heli).to receive(:airborne).and_return(true)
      allow(airport_good).to receive(:stormy?).and_return(false)
      airport_good.land(plane)
      airport_good.land(heli)
      allow(plane).to receive(:airborne).and_return(false)
      airport_good.launch(plane)
      expect(airport_good.hangar).not_to include(plane)
    end
  end

  context ' hangar capacity tests: ' do
    it 'should respond to full? with true if airport is full' do
      allow(airport_good).to receive(:stormy?).and_return(false)
      expect(river_hudson.full?).to eq true
    end
    it 'should respond to full? with false if airport is not full' do
      expect(airport_good.full?).to eq false
    end
    it 'plane should not be able to land at full airport' do
      airport_good.hangar_capacity.times { airport_good.hangar.push("") }
      allow(airport_good).to receive(:stormy?).and_return(false)
      expect { airport_good.land(plane) }.to raise_error(airport_good.errors[:space])
    end
    it 'should have default capacity' do
      expect(airport_good.hangar_capacity).to satisfy { |x| x.is_a? Integer }
    end
    it 'should be able to set airport capacity' do
      dual_carriageway = Airport.new(1)
      allow(dual_carriageway).to receive(:stormy?).and_return(false)
      expect(dual_carriageway.hangar_capacity).to eq 1
    end
  end

  context ' weather tests: ' do
    it 'should not allow plane to land in stormy weather' do
      allow(plane).to receive(:airborne).and_return(true)
      allow(airport_bad).to receive(:stormy?).and_return(true)
      expect { airport_bad.land(plane) }.to raise_error(airport_good.errors[:weather])
    end
    it 'should not allow plane to launch in stormy weather' do
      allow(plane).to receive(:airborne).and_return(false)
      airport_bad.hangar.push(plane)
      allow(airport_bad).to receive(:stormy?).and_return(true)
      expect { airport_bad.launch(plane) }.to raise_error(airport_good.errors[:weather])
    end

  end

  context 'Edge case tests: ' do
    it "should not land a plane that isn't in the air" do
      allow(plane).to receive(:airborne).and_return(false)
      allow(airport_good).to receive(:stormy?).and_return(false)
      expect { airport_good.land(plane) }.to raise_error(airport_good.errors[:landed])
    end
    it "should not launch a plane that isn't in the airport" do
      expect { airport_good.launch(plane) }.to raise_error(airport_good.errors[:present])
    end
    it 'should not land the same plane twice without launching it' do
      allow(plane).to receive(:airborne).and_return(true)
      allow(airport_good).to receive(:stormy?).and_return(false)
      airport_good.land(plane)
      allow(plane).to receive(:airborne).and_return(false)
      expect { airport_good.land(plane) }.to raise_error(airport_good.errors[:already])
    end
    it "should not launch a plane that isn't on the ground" do
      allow(plane).to receive(:airborne).and_return(true)
      airport_good.hangar.push(plane)
      allow(airport_good).to receive(:stormy?).and_return(false)
      expect { airport_good.launch(plane) }.to raise_error(airport_good.errors[:in_flight])
    end
  end
end
