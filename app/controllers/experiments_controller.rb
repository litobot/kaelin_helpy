class ExperimentsController < ApplicationController
  def index
    @long_running_experiments = Experiment.long_running_experiments
  end
end