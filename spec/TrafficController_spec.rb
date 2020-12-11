require 'TrafficController'
require 'Plane'
require 'Airport'

RSpec::Matchers.define :be_boolean do
    match do |actual|
      expect(actual).to be(true).or be(false)
    end
  end

describe TrafficController do
    let(:controller) {TrafficController.new}

    describe "When created, " do
        it "has an 'airport' object as an attribute" do
            expect(controller.airport).to be_instance_of(Airport)
        end

        it "randomises the weather" do
            outcomes = []
            100.times do
                new_controller = TrafficController.new
                outcomes << new_controller.weather_clear?
            end
            expect(outcomes.count(false)).to be_between(12, 28).exclusive
        end
    end

    describe "weather" do
        it "can check if the weather is clear" do
            expect(controller.weather_clear?).to be_boolean
        end

        it "can randomise weather" do
            outcomes = []
            100.times do
                controller.randomise_weather
                outcomes << controller.weather_clear?
            end
            expect(outcomes.count(false)).to be_between(12, 28).exclusive
            # H0 - P = 0.2
            # H1 - P ≠ 0.2
            # X ~ B(100,0.2)
            # 0.054 significance level
        end

        it "can override random weather" do
            controller.override_weather("clear")
            expect(controller.weather_clear?).to eq true
        end
    end
end