require 'airport'
require './lib/plane'

describe Airport do

describe '#permission_to_land' do
  it 'allows plane to land at airport' do
    expect(subject.permission_to_land).to eq true
  end
end

end
