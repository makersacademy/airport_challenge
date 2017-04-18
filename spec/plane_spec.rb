require 'plane'

describe Plane do

it { is_expected.to respond_to 'landed'}

it 'confirms that it had landed' do
  subject.land
  expect(subject.landed).to eq true
end

it 'confirms that it had taken off' do
  subject.take_off
  expect(subject.landed).to eq false
end


end
