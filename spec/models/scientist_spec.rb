require 'rails_helper'

RSpec.describe Scientist, type: :model do
  it { should belong_to :lab }
  it { should have_many :scientist_experiments }
  it { should have_many(:experiments).through(:scientist_experiments) }
end
