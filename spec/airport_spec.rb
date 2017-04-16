require 'airport'

RSpec.describe Airport do
  
  it {is_expected.to respond_to(:run_way)}

  it '#run_way should defualt to an empty array' do
  expect(subject.run_way).to eq([])
end


end
