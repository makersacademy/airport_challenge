require './airport.rb'

describe Airport do

  it 'has a set capacity with a default of 200' do
    test = Airport.new('nottingham')
    expect(test.total_capacity).to eq(200)
  end

  it 'can initialize with different capacity' do
    test = Airport.new(300, 'cardiff')
    expect(test.total_capacity).to eq(300)
  end

  it 'can initialize with different locations' do
    test = Airport.new('birmingham')
    expect(test.location).to eq('birmingham')
  end

  it 'can reduce the capacity by 1 when 1 plane lands there' do
    test = Airport.new('cambridge')
    allow(test).to receive(:check_weather) { false }
    test.land(222)
    expect(test.check_capacity).to eq(199)
  end

  it 'can reduce the capacity by 2 when 2 planes land there' do
    test = Airport.new('oxford')
    allow(test).to receive(:check_weather) { false }
    test.land(234)
    test.land(2343)
    expect(test.check_capacity).to eq(198)
  end

  it 'can reduce the capacity by several when many planes lands there' do
    test = Airport.new('sheffield')
    allow(test).to receive(:check_weather) { false }
    test.land(523)
    test.land(444)
    test.land(111)
    test.land(123)
    expect(test.check_capacity).to eq(196)
  end

  it 'can tell you whether a plane is in the airport' do
    test = Airport.new('manchester')
    test.plane_log_add(123)
    expect(test.check_plane_log(123)).to eq(true)
  end

  it 'can tell you when planes are not in the airport' do
    test = Airport.new('manchester')
    expect(test.check_plane_log(155)).to eq(false)
  end

  it 'can add the plane to the plane log' do
    test = Airport.new('stanstead')
    test.plane_log_add(123)
    expect(test.check_plane_log(123)).to eq(true)
  end

  it 'adds plane to airport log when it lands' do
    test = Airport.new("brighton")
    allow(test).to receive(:check_weather) { false }
    test.land(999)
    expect(test.check_plane_log(999)).to eq(true)
  end

  it 'can remove the plane from the plane log' do
    test = Airport.new('liverpool')
    test.plane_log_add(333)
    test.plane_log_delete(333)
    expect(test.check_plane_log(333)).to eq(false)
  end

  it 'removes plane from airport log when it has taken off' do
    test = Airport.new('chesterfield')
    test.plane_log_add(333)
    allow(test).to receive(:check_weather) { false }
    expect(test.take_off(333)).to eq("This plane number 333 has left chesterfield airport.")
  end

  it 'does not allow a plane to take off if it is not at the airport' do
    test = Airport.new('coventry')
    allow(test).to receive(:check_weather) { false }
    expect(test.take_off(322)).to eq("This plane is not in this airport, it cannot take off.")
  end

  it 'does not allow a plane to land if there is not capacity at airport' do
    test = Airport.new(0, "loughborough")
    allow(test).to receive(:check_weather) { false }
    expect(test.land(9876)).to eq"loughborough airport has 0 spaces left, your plane cannot land at this time."
  end

  # it 'checks weather has an output that is sunny or stormy' do
  #   test = Airport.new("brighton")
  #   expect(test.check_weather).to eq(true||false)
  # end

  it 'can check whether the weather is stormy' do
    test = Airport.new("glasgow")
    allow(test).to receive(:check_weather) { true }
    expect(test.check_weather).to eq(true)
  end

  it 'can check whether the weather is not stormy' do
    test = Airport.new("glasgow")
    allow(test).to receive(:check_weather) { false }
    expect(test.check_weather).to eq(false)
  end

  it 'will not allow a plane to take off while weather is stormy' do
    test = Airport.new("stockport")
    test.plane_log_add(333)
    allow(test).to receive(:check_weather) { true }
    expect(test.take_off(333)).to eq("You cannot fly it is too stormy.")
  end

  it 'will allow a plane to take off while weather is not stormy' do
    test = Airport.new("tamworth")
    test.plane_log_add(3234)
    allow(test).to receive(:check_weather) { false }
    expect(test.take_off(3234)).to eq("This plane number 3234 has left tamworth airport.")
  end

  it 'will not allow a plane to land while weather is stormy' do
    test = Airport.new("loughborough")
    allow(test).to receive(:check_weather) { true }
    expect(test.land(9876)).to eq("You cannot land it is too stormy.")
  end

  it 'will allow a plane to land while weather is not stormy' do
    test = Airport.new("newstead")
    allow(test).to receive(:check_weather) { false }
    expect(test.land(9876)).to eq("This plane has landed at newstead.")
  end

  # it 'allows plane instance to be created and stored in plane log' do
  #   test = Airport.new("derby")
  #   allow(test).to receive(:plane_id) { "1234" }
  #   expect(test.invent_plane).to eq("1234")
  # end
end
