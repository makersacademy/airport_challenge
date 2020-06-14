require 'airport.rb'

describe 'Airport' do
  let(:airport) { Airport.new }

  it 'creates an instance of the Airport class' do
    expect(airport).to be_an_instance_of(Airport)
  end

  describe '#land' do
    it "lands a plane" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

end
