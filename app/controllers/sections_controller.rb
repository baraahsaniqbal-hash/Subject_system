class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @pages = Page.all
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to sections_path
    else
      @pages = Page.all
      @section_count = Section.count + 1
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.all
    @section_count = Section.count
  end

  def update 
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to section_path(@section.id)
    else
      @pages = Page.all
      @section_count = Section.count
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully."
    redirect_to sections_path
  end

  private 

  def section_params 
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content) 
  end

end
