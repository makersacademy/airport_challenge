require "airport"


describe Airport do

  it { is_expected.to respond_to :landed}

  it 'confirms a plane has landed' do
    plane = Plane.new
    subject.landed(plane)
    weather = Weather.new.stormy
    expect(subject.stormy).to eq weather
  end


  it { is_expected.to respond_to :departure}

  it 'plane departs from airport' do
  plane = Plane.new
  subject.landed(plane)
  weather = Weather.new.stormy
  subject.departure
  expect(subject.stormy).to eq weather
  end

  it { is_expected.to respond_to :stormy}

  #it 'prevents planes from departing if stormy' do
  #expect {subject.stormy}.to raise_error 'Unable to depart due to stormy weather'
  #end

end
