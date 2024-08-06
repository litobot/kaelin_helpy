require "rails_helper"

RSpec.describe ScientistExperiment, type: :model do
  it { should belong_to :scientist }
  it { should belong_to :experiment }
end