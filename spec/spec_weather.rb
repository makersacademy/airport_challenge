require 'weather'

RSpec.describe Weather do
    describe ".storm" do
        it "when storm" do
          testweather = subject.initialise("random")
          allow(chance).to receive(:stormy) { 5 }
          expect(subject.storm).to eq("storm")
        end
    end
end