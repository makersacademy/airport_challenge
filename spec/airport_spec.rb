require './lib/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:land) }
  describe '#land' do
    it 'responds to a command to land with 1 arg' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe '#takeoff' do
    it 'responds to a command to takeoff with 1 arg' do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end
  end  
end