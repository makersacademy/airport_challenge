require 'airport'

describe Airport do

  it 'has an Airport class' do
    expect(subject).to be_a(Airport)
  end

  it 'has a constant CAPACITY with a default value of 5' do
    expect(Airport::CAPACITY).to eq(5)
  end

  it 'can specify the value of CAPACITY when an Airport is instantiated' do
    test_capacity = rand(10) + 1
    airport = Airport.new(test_capacity)
    expect(airport.capacity).to eq(test_capacity)
  end

  it 'can alter CAPACITY as needed (post-instantiation)' do
    new_capacity = 10
    airport = Airport.new
    airport.set_capacity(new_capacity)
    expect(airport.capacity).to eq(new_capacity)
  end

  it 'has an array to store planes' do
    expect(subject.instance_variable_get(:@stored_planes)).to be_a(Array)
  end

  it 'can display stored planes array' do
    expect(subject.instance_variable_get(:@stored_planes)).to eq(subject.stored_planes)
  end

  it "won't accept planes landing once at capacity" do

  end

end
