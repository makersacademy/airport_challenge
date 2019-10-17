require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'shows plane has left the airport' do
  expect(subject.take_off).to eq ('This plane has left the airport')
  end

  it 'should raise error if airport is full' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport is full'
  end


end
