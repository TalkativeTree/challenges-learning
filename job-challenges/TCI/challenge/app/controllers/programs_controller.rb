class ProgramsController < ApplicationController
  def index
    @programs = Programs.all
  end

  def show
    @program = Programs.where(id: params[:id]).take
  end

  private

  def program_params
    params.require(:program).permit(:title, :subtitle, :code)
  end
end
