require 'airports'

describe Airports do

  it 'sets default plane capacity to 20 planes' do
    # This is only a test program, normally it would be more!

    expect(subject.capacity).to eq 20
  end
end
