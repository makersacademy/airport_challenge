require_relative '../lib/plane'

describe Plane do
  let(:boeing) { Plane.new }

  it 'can land in an airports hangar' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    expect(boeing.land(heathrow)).to eq [boeing]
  end

  it 'will raise an error if a plane tries to land when it is already in the airport' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    boeing.land(heathrow)
    expect { boeing.land(heathrow) }.to raise_error "#{boeing} is already landed"
  end

  it 'will raise an error if a plane tries to land when the airport hangar is full' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    heathrow.capacity.times { Plane.new.land(heathrow) }
    expect { boeing.land(heathrow) }.to raise_error "#{heathrow} is full"
  end

  it 'can take off from an airport' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    boeing.land(heathrow)
    expect(boeing.take_off(heathrow)).to eq boeing
  end

  it 'can confirm it has left an airport when it takes off' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    boeing.land(heathrow)
    expect { boeing.take_off(heathrow) }.to output("#{boeing} has left #{heathrow}\n").to_stdout
  end

  it 'can confirm it has been removed from an airports hangar after it has taken off' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    boeing.land(heathrow)
    boeing.take_off(heathrow)
    expect(heathrow.hangar).to eq []
  end

  it 'will raise an error if a plane tries to take off when it is already flying' do
    heathrow = double("airport", :hangar => [])
    expect { boeing.take_off(heathrow) }.to raise_error "#{boeing} is already flying"
  end

  it 'will raise an error if a plane tries to take off that is not currently in the airport' do
    heathrow = double("airport", :hangar => [], :capacity => 60)
    manchester = double("airport", :hangar => [], :capacity => 29)
    boeing.land(manchester)
    expect { boeing.take_off(heathrow) }.to raise_error "#{boeing} is not currently at #{heathrow}"
  end
end
