class LecturesController < ApplicationController

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to lectures_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update(lecture_params)
      redirect_to lecture_path(params[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    if @lecture.destroy
      redirect_to lectures_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def lecture_params
    params.require(:lecture).permit(:name, :body)
  end
end
