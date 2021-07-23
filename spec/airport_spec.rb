require 'airport.rb'

describe Airport do 
  subject(:airport) { described_class.new }
  # it { is_expected.to respond_to :plane_landing }

  # it { is_expected.to respond_to :plane_takeoff }

  # it { is_expected.to respond_to :weather }

  # it { is_expected.to respond_to :full? }

  it 'instruct a plane to land at an airport' do
    expect(airport).to respond_to(:landing).with(1).argument
    end 

  it 'instruct a plane to take off from an airport' do 
    expect(airport).to respond_to(:take_off)#.with(1).argument
  end 

  it 'confirm that it is no longer in the airport' do
  end
  # it 'airport has space' do 
  #   capacity = Airport.new
  #   expect(capacity.full?).to 
  # end 

  it 'prevents landing when full' do
    5.times { airport.landing Airport.new }
    expect { airport.landing Airport.new }. to raise_error 'No space to land'
  end

  it 'default airport capacity that can be overridden' do
  end

  it 'prevents take off when stormy' do
  end

  it 'prevents landing when stormy' do
  #  expect { subject.landing }. to raise_error 'Weather is stormy'
  end
end
