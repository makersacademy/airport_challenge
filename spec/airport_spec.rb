require 'airport.rb'

describe Airport do
  context do
    before do
      let(:plane) { double :plane, status: 'grounding' }
    end
  end

  it 'is an airport' do
    expect(subject).to be_an_instance_of(Airport)
  end

  it 'when a plane is instructed to land' do
    plane_double = double
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

  it 'when a plane is passed as an argument for land' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    expect(airport.land(plane_double))
  end

  it 'when instructing plane to land, return status as grounded' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    expect(airport.land(plane_double)).to eq('grounded')
  end

  it 'when instructing plane to takeoff' do
    plane_double = plane_double
    airport = Airport.new
    expect(airport).to respond_to(:takeoff)
  end

  it 'when plane is passed as an argument to takeoff' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    expect(airport.takeoff(plane_double))
  end

  it 'when plane has taken off, confirm it is no longer in airport' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    airport.land(plane_double)
    airport.takeoff(plane_double)
    expect(airport.hanger).not_to include(plane_double)
  end

  it 'when plane hasnt taken off, confirm it is still in the hanger' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    airport.land(plane_double)
    expect(airport.hanger).to include(plane_double)
  end

  it 'when weather is stormy, plane cannot takeoff' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    # airport.todays_weather
    allow(airport.stormy?).to receive(:stormy)
    airport.land(plane_double)

    expect { airport.safety }.to raise_error(RuntimeError, 'Bad weather')
  end

  # it "when weather is fine, planes can takeoff" do
  #   plane_double = double('plane_double', status: 'grounded')
  #   airport = Airport.new
  #   airport.land(plane_double)
  #   allow(@todays_weather).to receive(:stormy).and_return(true)
  #   expect { airport.safety }.to raise_error('Bad weather conditions')
  #
  # end
end
