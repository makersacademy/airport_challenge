require 'airport'
require './lib/plane'

describe Airport do

describe '#permission_to_land' do
  it 'gives a plane permission to land at airport' do
    expect(subject.permission_to_land).to eq true
  end
end

describe '#permission_to_take_off' do
  it 'gives a plane permission to leave the airport' do
    expect(subject.permission_to_take_off).to eq true
  end
end

end
