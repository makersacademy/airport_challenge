require 'traffic_controller'

describe TrafficController do
  describe '(#instruct)' do
    it "makes planes respond to instructions" do
      expect(subject).to respond_to(:instruct).with(1).argument
    end

  end
end
