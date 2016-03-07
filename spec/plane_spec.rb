require 'plane'

describe Plane do

it { is_expected.to respond_to 'landed'}

it 'confirms that it had landed' do
  subject.landed?
  expect(subject).to be_landed
end

it 'confirms that it had taken off' do
  subject.taken_off?
  expect(subject.landed).to eq false
end


end
