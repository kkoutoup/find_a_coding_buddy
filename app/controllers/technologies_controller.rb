class TechnologiesController < ApplicationController

  def technology_params
    params.require(:technology).permit(:name, :photo)
  end

end
