require 'airport'
require 'plane'

describe 'Airport' do
  it 'responds to method #land' do
    expect(Airport.new).to respond_to :land
    puts subject
  end
  # describe '#land' do
  #   it 'responds to method #land' do
  #     expect(subject).to respond_to :land
  #   end
end
