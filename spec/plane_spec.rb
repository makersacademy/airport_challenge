require_relative '../lib/plane'

describe Plane do
  let(:boeing) { Plane.new }

  it 'can land in an airports hangar' do
    heathrow = double("airport", :hangar => [], :capacity => 60, :check_weather => "Sunny")
    expect(boeing.land(heathrow)).to eq [boeing]
  end

  it 'will raise an error if a plane tries to land when it is already landed' do
    boeing.state = "Landed"
    heathrow = double("airport", :hangar => [boeing], :capacity => 60, :check_weather => "Sunny")
    expect { boeing.land(heathrow) }.to raise_error "#{boeing} is already landed"
  end

  it 'will raise an error if a plane tries to land when the airport hangar is full' do
    heathrow = double("airport", :hangar => [], :capacity => 60, :check_weather => "Sunny")
    heathrow.capacity.times { Plane.new.land(heathrow) }
    expect { boeing.land(heathrow) }.to raise_error "#{heathrow} is full"
  end

  it 'can take off from an airport' do
    boeing.state = "Landed"
    heathrow = double("airport", :hangar => [boeing], :capacity => 60, :check_weather => "Sunny")
    expect(boeing.take_off(heathrow)).to eq boeing
  end

  it 'can confirm it has been removed from an airports hangar after it has taken off' do
    boeing.state = "Landed"
    heathrow = double("airport", :hangar => [boeing], :capacity => 60, :check_weather => "Sunny")
    boeing.take_off(heathrow)
    expect(heathrow.hangar).to eq []
  end

  it 'will raise an error if a plane tries to take off when it is already flying' do
    heathrow = double("airport", :hangar => [], :capacity => 60, :check_weather => "Sunny")
    expect { boeing.take_off(heathrow) }.to raise_error "#{boeing} is already flying"
  end

  it 'will raise an error if a plane tries to take off that is not currently in the airport' do
    boeing.state = "Landed"
    heathrow = double("airport", :hangar => [], :capacity => 60, :check_weather => "Sunny")
    manchester = double("airport", :hangar => [boeing], :capacity => 29, :check_weather => "Sunny")
    expect { boeing.take_off(heathrow) }.to raise_error "#{boeing} is not currently at #{heathrow}"
  end

  it 'will stop the plane landing if the weather is stormy' do
    heathrow = double("airport", :hangar => [], :capacity => 60, :check_weather => "Stormy")
    expect { boeing.land(heathrow) }.to raise_error "#{boeing} cannot land, the weather is stormy"
  end

  it 'will stop the plane from taking off if the weather is stormy' do
    boeing.state = "Landed"
    heathrow = double("airport", :hangar => [boeing], :capacity => 60, :check_weather => "Stormy")
    expect { boeing.take_off(heathrow) }.to raise_error "#{boeing} cannot take off, the weather is stormy"
  end
end
