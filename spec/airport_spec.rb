require 'airport'

describe Airport do

  describe "#land" do
    it 'responds to #land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe "#take_off" do
    it 'responds to #take_off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end

end
