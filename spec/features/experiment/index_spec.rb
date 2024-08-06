require "rails_helper"

RSpec.describe "Experiment Index Page" do
  before :each do
    @experiment_1 = Experiment.create!(name: "Dat Ass", objective: "Discover It", num_months: 3)
    @experiment_2 = Experiment.create!(name: "Dis Ass", objective: "Touch It", num_months: 7)
    @experiment_3 = Experiment.create!(name: "Yo Ass", objective: "Eat It", num_months: 15)
    @experiment_4 = Experiment.create!(name: "Yo Momma", objective: "Suck It", num_months: 9)
    @experiment_5 = Experiment.create!(name: "Yo Daddy", objective: "Pump It", num_months: 12)
    @experiment_6 = Experiment.create!(name: "Yo Sister", objective: "Douche It", num_months: 4)
  end
  it "displays all long running experiments > 6 months from longest to shortest" do
    visit experiments_path

    within "#long_running_experiments" do
      expect(page).to_not have_css("#experiment_id-#{@experiment_1.id}")
      expect(page).to_not have_css("#experiment_id-#{@experiment_6.id}")
      expect(page).to_not have_content("Dat Ass")
      expect(page).to_not have_content("Yo Sister")
      expect(page).to have_css("#experiment_id-#{@experiment_3.id} ~ #experiment_id-#{@experiment_5.id}")
      expect(page).to have_css("#experiment_id-#{@experiment_5.id} ~ #experiment_id-#{@experiment_4.id}")
      expect(page).to have_css("#experiment_id-#{@experiment_4.id} ~ #experiment_id-#{@experiment_2.id}")
    end

    within "#experiment_id-#{@experiment_3.id}" do
      expect(page).to have_content(@experiment_3.name)
    end
    within "#experiment_id-#{@experiment_5.id}" do
      expect(page).to have_content(@experiment_5.name)
    end
    within "#experiment_id-#{@experiment_4.id}" do
      expect(page).to have_content(@experiment_4.name)
    end
    within "#experiment_id-#{@experiment_2.id}" do
      expect(page).to have_content(@experiment_2.name)
    end
  end
end