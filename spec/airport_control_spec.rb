require 'airport_control'

describe AirportFlow do
  it 'can create a instance of airport control' do
    airport_flow = AirportFlow.new
    expect(airport_flow).to be_kind_of(AirportFlow)   
  end
  it 'can respond to land instructions' do
    airport_flow = AirportFlow.new
    expect(airport_flow).to respond_to(:land)
  end
  it 'can respond to takeoff instructions' do
    airport_flow = AirportFlow.new
    expect(airport_flow).to respond_to(:takeoff)
  end
  it 'should responde to land when full' do
    airport_flow = AirportFlow.new
    expect(airport_flow).to respond_to(:takeoff).with(1).argument
  end
  it 'should respond to take off when stormy' do
    airport_flow = AirportFlow.new
    expect(airport_flow).to respond_to(:land).with(1).argument
  end
end
