require 'airport.rb'

describe Airport do

  let(:plane) {double :plane}

  it 'raise an error if is full' do
    subject.landing(plane)
    expect {subject.landing(plane)}.to raise_error 'airport is full'
  end

end
