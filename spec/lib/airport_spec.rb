require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:person) { double(:person) }

  it {is_expected.to respond_to(:load).with(1).argument }

  it 'can be instantiated' do
    expect(airport.class).to eq Airport
  end

  it 'can #load' do
    loads = airport.load(person)
    expect(loads).to eq airport
  end


end