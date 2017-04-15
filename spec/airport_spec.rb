require './lib/airport'

describe Airport do
  it 'should hold, land and allow planes to take off safely' do
    expect(subject).to be_instance_of Airport
  end
end
