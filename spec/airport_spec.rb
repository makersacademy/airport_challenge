require 'airport.rb'

describe Airport do 
  it { is_expected.to respond_to :plane_landing }

  it { is_expected.to respond_to :plane_takeoff }

  it { is_expected.to respond_to :weather }

  it { is_expected.to respond_to :full? }

  it 'lands plane' do 
  # landing = Airport.new
  # expect(landing.plane_landing).to be_truthy
  end 

  it 'plane takes off' do 
    takeoff = Airport.new
    expect(takeoff.plane_takeoff).to be_truthy
  end 

  # it 'airport has space' do 
  #   capacity = Airport.new
  #   expect(capacity.full?).to 
  # end 

  it 'prevents landing when full' do
    5.times { subject.plane_landing Airport.new }
    expect { subject.plane_landing Airport.new }. to raise_error 'No space to land'
  end

  it 'prevents take off when stormy' do
  end

  it 'prevents landing when stormy' do
  #  expect { subject.plane_landing }. to raise_error 'Weather is stormy'
  end
end
