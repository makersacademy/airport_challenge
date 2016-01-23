require 'airplane'

describe 'airplane' do

  before(:example) do
    @airplane = Airplane.new("airplane")
  end

  it 'flying = true' do
    expect(@airplane.flying).to eq(true)
  end

  it 'plane lands' do
    @airplane.plane_land
    expect(@airplane.flying).to eq(false)
  end


  it 'plane flyyyyy' do
    @airplane.plane_land
    @airplane.plane_take_off
    expect(@airplane.flying).to eq(true)
  end
end
