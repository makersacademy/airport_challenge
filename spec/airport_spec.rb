require "airport"
require "plane"
require "weather"

describe Airport do
  let(:plane) { instance_double(Plane) }
  let(:weather) { instance_double(Weather) }
  

  before do
    allow(plane).to receive(:instance_of?).with(Plane).and_return(true)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:landing)
    allow(plane).to receive(:offtake)
    allow(weather).to receive(:stormy?) { false }
  end

  describe '#capacity' do
    it { expect(subject.capacity).to eq 12 }

    it 'allows change to default capacity' do
      zurich = Airport.new(25)
      expect(zurich.capacity).to eq 25
    end
  end

  describe '#land' do
    let(:forecast) { instance_double(Weather) }

    it 'stores landed plane in hangar' do
      subject.land(plane)
      expect(subject.hangar.empty?).to eq(false)
    end

    it "lands plane objects only" do
      message = 'We accept only planes at this airport!'
      expect { subject.land('Turtle') }.to raise_error message
    end

    it 'refuses landing grounded plane' do
      allow(plane).to receive(:flying?).and_return(false)
      message = 'Before landing, you have to start your engine first'
      expect { subject.land(plane) }.to raise_error message
    end

    it 'refuse landing in full hangar' do
      12.times { subject.land(plane) }
      message = 'Our hangar is full, please land somewhere else'
      expect { subject.land(plane) }.to raise_error message
    end

    # it 'refuses landing when stormy' do
    #   allow(forecast).to receive(:stormy?) { true }
    #   message = 'The landing is delayed due to stormy weather'
    #   expect { subject.land(plane) }.to raise_error message
    # end
  end

  describe '#takeoff' do
    it 'removes plane taking off' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.hangar.empty?).to eq(true)
    end

    it 'takeoff plane objects only' do
      allow('Bus').to receive(:takeoff)
      message = 'We allow only planes to takeoff at this airport!'
      expect { subject.takeoff('Bus') }.to raise_error message
    end

    it 'refuse takeoff in empty hangar ' do
      message = 'There are no planes in our hangar'
      expect { subject.takeoff(plane) }.to raise_error message
    end
    
    # it 'refuses takeoff when stormy' do
    #   subject.hangar.push(plane)
    #   allow(weather).to receive(:stormy?) { true }
    #   message = 'Takeoff is delayed due to stormy weather'
    #   expect { subject.takeoff(plane)}.to raise_error message
    # end
  end
end
