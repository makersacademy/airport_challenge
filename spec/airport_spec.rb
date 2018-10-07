require 'airport'

describe Airport do
  it 'can hold a number of planes, defaulting to the DEFAULT_CAPACITY' do
    i = 0
    50.times do
      subject.request_landing(Plane.new("plane_#{i}"))
      i += 1
    end
    expect { subject.request_landing(Plane.new("plane_#{i}")) }.to raise_error
  end

  it 'can have a different capacity if this is was specified at creation' do
    big_airport = Airport.new("big_airport", 100)
    i = 0
    100.times do
      big_airport.request_landing(Plane.new("plane_#{i}"))
      i += 1
    end
    expect { big_airport.request_landing(Plane.new("plane_#{i}")) }.to raise_error
  end
end
