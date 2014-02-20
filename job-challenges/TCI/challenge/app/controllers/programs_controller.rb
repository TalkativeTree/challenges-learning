class ProgramsController < ApplicationController
  def index
    @programs = Programs.all
  end
  private

  def program_params
    params.require(:program).permit(:title, :subtitle, :code)
  end
end
