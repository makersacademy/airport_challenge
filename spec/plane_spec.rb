require 'plane'
require 'weather'

describe Plane do

  it { is_expected.to respond_to :land }

  it 'responds to land request' do
  subject.land
  weather = Weather.new
  expect(subject.land).to_not eq weather
  end

  it { is_expected.to respond_to :depart }

  it 'responds to depart request' do
  subject.depart
  weather = Weather.new.stormy
  expect(subject.depart).to_not eq weather
  end


end
