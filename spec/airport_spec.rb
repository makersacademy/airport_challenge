require "airport"

describe Airport do
  it 'is available as described class' do
    expect(described_class).to eq(Airport)
  end

  it { is_expected.to respond_to(:get_hangar).with(0).argument }

  it 'is checking if plane is allowed to land' do
    airport = Airport.new
    hangar = airport.get_hangar
    expect(airport.allowed_to_land()).to eq true
  end

  it 'is checking if the plane landed' do
  airport = Airport.new
  hangar = airport.get_hangar
  airport.land_plane('lll')
  expect(airport.how_many_landed).to eq(1)
  end
end



  # it 'responds to initialize' do
  #   expect(subject).to respond_to(:initialize)
  # end

  # it 'the instance it has a property of an empty array'
  #   expect(subject).to eq([])
  # end



# @hangar =
