require_relative '../lib/plane'

describe Plane do
  let(:boeing) { Plane.new }

  it 'can land in an airports hangar' do
    heathrow = double("airport", :hangar => [])
    expect(boeing.land(heathrow)).to eq [boeing]
  end

  it 'can take off from an airport' do
    heathrow = double("airport", :hangar => [boeing])
    expect(boeing.take_off(heathrow)).to eq boeing
  end

  it 'can confirm it has left an airport when it takes off' do
    heathrow = double("airport", :hangar => [boeing])
    expect { boeing.take_off(heathrow) }.to output("#{boeing} has left #{heathrow}\n").to_stdout
  end

  it 'can confirm it has been removed from an airports hangar after it has taken off' do
    heathrow = double("airport", :hangar => [boeing])
    boeing.take_off(heathrow)
    expect(heathrow.hangar).to eq []
  end
end
