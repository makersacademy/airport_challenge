require 'capybara/rspec'

feature "the control tower can make announcements" do
  scenario "about the weather" do
    control = ControlTower.new
    expect(control.forecast).to eql(:sunny || :stormy)
  end
end
