require 'airport.rb'
require 'airplane.rb'

describe Airport do
  let(:airport) {Airport.new}
  let(:airplane) {Airplane.new}
  it 'can instruct plane to take off' do
    airport.airport << airplane 
    airport.instruct_take_off
    expect(airplane.flying).to eq true
  end

  it 'can remove airplane from list of airplanes' do 
    airport.airport << airplane
    airport.instruct_take_off
    expect(airport.airport.count).to eq 0
  end

  it 'can return the plane that has taken off' do 
    airport.airport << airplane
    expect(airport.instruct_take_off).to eq airplane
  end

  it 'can raise error when airport is full' do
  end
end
