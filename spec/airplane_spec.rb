require 'airplane'
describe Airplane do
  it "Shows that an instance of Airplane responds to the show_current_status method" do
    expect(subject).to respond_to :show_current_status
  end
  it "Returns airborne when show_current_status is called" do
    expect(subject.show_current_status).to eq @current_status
  end
  it "Shows that an instance of Airplane reponds to the take_off method" do
    expect(subject).to respond_to :take_off
  end
  it "Shows that the take_off methods changes the current_status instance variable to airborne" do
    expect(subject.take_off).to eq "airborne"
  end
  it "Shows that an instance of the Airplane class responds to the land method" do
    expect(subject).to respond_to :land
  end
  it "Shows that the land method changes the current_status instance variable to grounded" do
    expect(subject.land).to eq "grounded"
  end
  it "Shows that by default the show_current_status method will return grounded" do
    expect(subject.show_current_status).to eq "grounded"
  end
  it "Shows that the show_current_status method will return grounded if the land method is called and airborne when the take_off method is called" do
    subject.take_off
    expect(subject.show_current_status).to eq "airborne"
    subject.land
    expect(subject.show_current_status).to eq "grounded"
  end
end
