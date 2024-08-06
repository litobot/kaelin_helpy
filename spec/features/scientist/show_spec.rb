require "rails_helper"

RSpec.describe "Scientist Show Page" do
  before :each do
    @lab_1 = Lab.create!(name: "Butt Stuff")
    @lab_2 = Lab.create!(name: "Ass Stuff")
    @scientist = Scientist.create!(name: "Brady", specialty: "Proctology", university: "U Dubb", lab: @lab_1)
    @scientist_x = Scientist.create!(name: "Lito", specialty: "Assology", university: "U Wish", lab: @lab_1)
    @experiment_1 = Experiment.create!(name: "Dat Ass", objective: "Discover It", num_months: 3)
    @experiment_2 = Experiment.create!(name: "Dis Ass", objective: "Touch It", num_months: 7)
    @experiment_3 = Experiment.create!(name: "Yo Ass", objective: "Eat It", num_months: 90)
    ScientistExperiment.create!(scientist: @scientist, experiment: @experiment_1)
    ScientistExperiment.create!(scientist: @scientist, experiment: @experiment_3)
    ScientistExperiment.create!(scientist: @scientist_x, experiment: @experiment_1)
    ScientistExperiment.create!(scientist: @scientist_x, experiment: @experiment_3)
  end
  it "has a show page that has the right stuff on it" do
    visit scientist_path(@scientist)

    expect(page).to have_content("Name: #{@scientist.name}")
    expect(page).to have_content("Specialty: #{@scientist.specialty}")
    expect(page).to have_content("University: #{@scientist.university}")

    expect(page).to have_content("Lab: #{@scientist.lab.name}")

    within "#experiments" do
      @scientist.experiments.each do |experiment|
        within "#experiment_id-#{experiment.id}" do
          expect(page).to have_content(experiment.name)
        end
      end
    end
  end

  it "removes a scientist's experiment from its show page" do
    visit scientist_path(@scientist)

    within "#experiments" do
      within "#experiment_id-#{@experiment_1.id}" do
        expect(page).to have_button("Delete")
      end
      within "#experiment_id-#{@experiment_3.id}" do
        expect(page).to have_button("Delete")
      end
    end
    within "#experiment_id-#{@experiment_1.id}" do
      click_button "Delete"
    end
    expect(current_path).to eq(scientist_path(@scientist))
    expect(page).to_not have_css("#experiment_id-#{@experiment_1.id}")
    expect(page).to_not have_content(@experiment_1.name)

    visit scientist_path(@scientist_x)
    expect(page).to have_css("#experiment_id-#{@experiment_1.id}")
    within "#experiment_id-#{@experiment_1.id}" do
      expect(page).to have_content(@experiment_1.name)
    end
  end
end
