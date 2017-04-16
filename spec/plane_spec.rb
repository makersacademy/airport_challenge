require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:weather) { double :weather }
  let(:airport) { double :airport }
  let(:airport_1) { double :airport }
  let(:airport_2) { double :airport }

  it 'can land' do
    expect(plane).to respond_to :land
  end

  it 'can take-off' do
    expect(plane).to respond_to :take_off
  end

  it 'can confirm its status' do
    expect(plane).to respond_to :confirm_status
  end

  it 'can land at an airport and confirm that it has landed' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:full? => false, :receive => [])
    plane.land(weather, airport)
    expect(plane.confirm_status).to eq :landed
  end

  it 'take off from an airport and confirm' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:release => plane, :planes => [plane])
    plane.take_off(weather, airport)
    expect(plane.confirm_status).to eq :in_air
  end

  it 'can take off when instructed' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:full? => false, :release => [], :planes => [plane])
    plane.take_off(weather, airport)
    expect(plane.confirm_status).to eq :in_air
  end

  it 'can land at a specific airport' do
    allow(airport).to receive_messages(:planes => [], :full? => false, :receive => [])
    allow(weather).to receive_messages(:status => :sunny)
    plane.land(weather, airport)
  end

  it 'can take off in sunny weather' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:release => [plane], :planes => [plane])
    expect { plane.take_off(weather, airport) }.not_to raise_error
    expect(plane.confirm_status).to eq :in_air
  end

  it 'cannot take off when weather is stormy' do
    allow(weather).to receive_messages(:status => :stormy)
    message = "Cannot land in stormy weather"
    expect { plane.land(weather, airport) }.to raise_error message
  end

  it 'cannot take land when weather is stormy' do
    allow(weather).to receive_messages(:status => :stormy)
    message = "Cannot land in stormy weather"
    expect { plane.land(weather, airport) }.to raise_error message
  end

  it 'cannot land when the airport is full' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:full? => true)
    message = "Airport is at capacity"
    expect { plane.land(weather, airport) }.to raise_error message
  end

  it 'can only take off from airports that they are in' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport_1).to receive_messages(:planes => [], :full? => false, :receive => [])
    allow(airport_2).to receive_messages(:planes => [], :full? => false)
    plane.land(weather, airport_1)
    message = "I am not in that airport"
    expect { plane.take_off(weather, airport_2) }.to raise_error message
  end

  it "cannot take off from an airport that it has not landed at" do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:planes => [], :full? => false, :release => [plane])
    message = "I am not in that airport"
    expect { plane.take_off(weather, airport) }.to raise_error message
  end

  it "cannot land again if it has landed" do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:planes => [], :full? => false, :receive => [])
    plane.land(weather, airport)
    message = "I have already landed"
    expect { plane.land(weather, airport) }.to raise_error message
  end

  it "cannot take off if already in-flight" do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:planes => [plane], :full? => false, :receive => [], :release => self)
    plane.land(weather, airport)
    plane.take_off(weather, airport)
    message = "I am already in the air"
    expect { plane.take_off(weather, airport) }.to raise_error message
  end

end
