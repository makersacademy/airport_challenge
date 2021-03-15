require 'spec_helper'
require 'airport'
require 'weather'

describe 'Controller' do 
  controller = Controller.new
  boeing747 = controller.plane(boeing747)
  it 'instructs a plane to land' do
    expect(boeing747).to respond_to(:land)
  end
  
  it 'checks weather is safe for landing' do
    weather = Weather.new
    weather.stormy? == true
    expect(controller.safe_landing(boeing747)).to raise_error('unsafe conditions')
  end
    
  it 'instructs a plane to take off' do
    expect(boeing747).to respond_to(:takeoff)
  end
    
  it 'checks weather is safe for takeoff' do
    weather = Weather.new
    weather.stormy? == true
    expect(controller.safe_takeoff(boeing747)).to raise_error('unsafe conditions')
  end

  end