require 'airport'

describe Airport do
  it 'can instruct a plane to land' do
    controller = Airport.new

    expect(controller.land).to eq("plane landed")
  end

  it 'can instruct a plane to take off who will confirm it has' do
    controller = Airport.new

    expect(controller.take_off).to eq("plane has taken off")
  end

  it 'ensures safety by preventing landings when the airport is full' do
    controller = Airport.new

    expect(controller.full_airport).to eq("do not land airport is full")
  end

end