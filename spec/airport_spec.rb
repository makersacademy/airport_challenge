require 'airport'

describe Airport do

  let(:airplane) {double(:airplane)}

  it 'should be empty on initialization' do
    airport = Airport.new
    expect(airport.get_airplanes.length).to eq 0
  end

  describe '# accept_landing' do
    it 'should increase airplanes array by 1' do
    airport = Airport.new
    airport.accept_landing(airplane)
    expect(airport.get_airplanes.length).to eq 1
  end
  end

  describe '# accept_takeoff' do
    it 'should decrease airplanes array by 1' do
      airport = Airport.new
      airport.accept_landing(airplane)
      airport.accept_landing(airplane)
      airport.accept_takeoff(airplane)
      expect(airport.get_airplanes.length).to eq 1
    end
  end
end
