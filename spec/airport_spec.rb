require 'airport'

describe Airport do
  subject { Airport.new }

  it 'Creates an instance of Airport' do
    expect(subject).to be_instance_of Airport
  end
end
