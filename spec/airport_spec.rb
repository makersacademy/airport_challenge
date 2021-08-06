require "airport"
require "plane"
require "weather"

describe Airport do
  let(:plane) { instance_double(Plane) }
  let(:airport) { Airport.new(12, :sunny) }

  before do
    allow(plane).to receive(:instance_of?).with(Plane).and_return(true)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:landing)
    allow(plane).to receive(:offtake)
  end

  describe '#capacity' do
    it { expect(subject.capacity).to eq 12 }

    it 'allows change to default capacity' do
      zurich = Airport.new(25)
      expect(zurich.capacity).to eq 25
    end
  end

  describe '#land' do
    it 'stores landed plane in hangar' do
      airport.land(plane)
      expect(airport.hangar.empty?).to eq(false)
    end

    it "lands plane objects only" do
      message = 'We accept only planes at this airport!'
      expect { airport.land('Turtle') }.to raise_error message
    end

    it 'refuses landing grounded plane' do
      allow(plane).to receive(:flying?).and_return(false)
      message = 'Before landing, you have to start your engine first'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'refuse landing in full hangar' do
      12.times { airport.land(plane) }
      message = 'Our hangar is full, please land somewhere else'
      expect { airport.land(plane) }.to raise_error message
    end

  end

  # describe 'landing in stormy airport' do
    
  #   allow(weather).to receive(:stormy?).and_return(true)
  #   it 'allows landing when not stormy aka sunny' do
  #     # allow(weather).to receive(:stormy?).and_return(false)
  #     expect { subject.land(plane) }.not_to raise_error
  #   end
  #   it 'refuses landing when stormy' do
  #     allow(weather).to receive(:stormy?).and_return(true)
  #     expect(weather.stormy?).to be true
  #     message = 'The landing is delayed due to stormy weather'
  #     expect { subject.land(plane) }.to raise_error message
  #   end
  #   it 'refuses landing when stormy' do
  #     allow(port).to receive(:is_stormy?).and_return(true)
  #     message = 'The landing is delayed due to stormy weather'
  #     expect { port.land(plane) }.to raise_error message
  #   end
  # end

  describe '#takeoff' do
    it 'removes plane taking off' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar.empty?).to eq(true)
    end

    it 'takeoff plane objects only' do
      allow('Bus').to receive(:takeoff)
      message = 'We allow only planes to takeoff at this airport!'
      expect { airport.takeoff('Bus') }.to raise_error message
    end

    it 'refuse takeoff in empty hangar' do
      message = 'There are no planes in our hangar'
      expect { airport.takeoff(plane) }.to raise_error message
    end
  end

  context 'stormy airport' do
    let(:stormy_port) { Airport.new(12, :stormy, [plane]) }
  
    it 'refuses landing when stormy' do
      message = 'The landing is delayed due to stormy weather'
      expect { stormy_port.land(plane) }.to raise_error message
    end

    it 'refuses takeoff when stormy' do
      message = 'Takeoff is delayed due to stormy weather'
      expect { stormy_port.takeoff(plane)}.to raise_error message
    end
  end
end
