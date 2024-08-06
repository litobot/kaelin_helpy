class ScientistExperimentsController < ApplicationController
  def destroy
    se = ScientistExperiment.find(params[:id])
    scientist = se.scientist
    se.destroy
    redirect_to scientist_path(scientist)
  end
end