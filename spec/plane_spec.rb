describe Plane do

  it 'returns true if plane has already landed into an airport' do
    airport = Airport.new
    air_control = AirTrafficControl.new
    air_control.instruct_landing(subject, airport)
    expect(subject.has_landed).to eq true
  end

end
