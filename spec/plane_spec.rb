require './lib/plane.rb'

describe Plane do
subject(:plane) { described_class.new }

  it 'confirms it has landed' do
    plane.landed?
    expect(plane). to have_attributes(:landed => true, :taken_off => false)
  end

  it 'confirms it has taken off' do
    plane.taken_off?
    expect(plane). to have_attributes(:landed => false, :taken_off => true)
  end

end
