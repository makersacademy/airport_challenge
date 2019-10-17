require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'shows plane has left the airport' do
  expect(subject.take_off).to eq ('This plane has left the airport')
  end
end
