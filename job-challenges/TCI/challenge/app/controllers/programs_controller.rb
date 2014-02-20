class ProgramsController < ApplicationController
  def index
    @programs = Programs.all
  end

  def show
    @program = Programs.where(id: params[:id]).take
  end

  def edit
    @program  = Programs.where(id: params[:id]).take
  end

  def new
    @program = Programs.new
  end

  def create
    @program = Programs.new(program_params)

    if @program.save
      flash[:notice] = "#{@program.title} sucessfully created!"
      redirect_to program_path(@program)
    else
      @errors = @program.errors.full_messages
      render :new
    end
  end

  def update
    @program = Programs.where(id: params[:id]).take
    if @program.update_attributes(program_params)
      flash[:notice] = "Successfully updated #{@program.title}"
      redirect_to program_path(@program)
    else
      render :edit
    end
  end

  private

  def program_params
    params.require(:program).permit(:title, :subtitle, :code)
  end
end
