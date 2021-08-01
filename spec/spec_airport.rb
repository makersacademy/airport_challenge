require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe Airport do
  before(:each) do
    @airport = Airport.new(12, :sunny)
    @rainy_port = Airport.new(12, :stormy)
    @plane = Plane.new
    @plane_in_hangar = Plane.new(:LX610, false)
  end

  it { is_expected.to be_instance_of Airport } 
  it { is_expected.to respond_to(:land).with(1).argument } 
  it { is_expected.to respond_to(:takeoff).with(1).argument } 

  it 'allows change to default capacity' do
    expect(subject.capacity).to eq 12
    zurich = Airport.new(25, :sunny)
    expect(zurich.capacity).to eq 25
  end

  context 'land method' do
    it 'stores landed plane' do
      allow@airport.land(@plane)
      expect(@airport.hangar.empty?).to eq false
    end

    # it 'refuses landing grounded plane' do
    #   message = 'Before landing you have to start your engine first'
    #   expect { @airport.land(@plane_in_hangar)}.to raise_error message
    # end

    it 'lands plane objects only' do
      chopper = double()
      allow(chopper).to receive(:flying?) {true}
      allow(chopper).to receive(:land)
      
      message = 'We accept only planes at this airport!'
      expect {@airport.land(chopper)}.to raise_error message
    end
    
    it 'refuse landing in full hangar' do
      12.times { subject.land Plane.new }
      message = 'Our hangar is full, please land somewhere else'
      expect { subject.land(@plane)}.to raise_error message
    end

    # it 'refuses landing when stormy' do
    #   message = 'The landing is delayed due to stormy weather'
    #   expect { @rainy_port.land(@plane) }.to raise_error message
    # end
  end
  
  context 'takeoff method' do
    it 'removes plane taking off' do
      @airport.land(@plane)
      @airport.takeoff(@plane)
      expect(@airport.hangar.empty?).to eq true
    end

    it 'refuses takeoff flying plane' do
      message = 'You are already in the air'
      expect {@airport.takeoff(@plane)}.to raise_error message
    end

    # it 'takeoff plane objects only' do
    #   chopper = double()
    #   allow(chopper).to receive(:flying?) {false}
    #   allow(chopper).to receive(:takeoff)
      
    #   message = 'We allow only planes to takeoff at this airport!'
    #   expect {@airport.takeoff(chopper)}.to raise_error message
    # end

    it 'refuse takeoff in empty hangar ' do
      @airport.hangar = []
      puts @airport.hangar
      message = 'There are no planes in our hangar'
      expect { @airport.takeoff(@plane)}.to raise_error message
    end

    # it 'refuses takeoff when stormy' do
    #   forecast = double()
    #   allow(forecast).to receive(:stormy?) {true}
    #   message = 'Takeoff is delayed due to stormy weather'
    #   expect { @rainy_port.takeoff(@plane)}.to raise_error message
    # end
  end
end
