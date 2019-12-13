require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:takeoff) }

  it 'planes cannot take of if stormy weather' do
  expect { subject.stormy_weather}.to raise_error 'planes cannot takeoff'
  end
end
