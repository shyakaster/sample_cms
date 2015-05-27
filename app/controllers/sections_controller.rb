class SectionsController < ApplicationController
  layout "admin"
  def index
    @sections=Section.sorted
  end

  def show
    @section=Section.find(params[:id])
  end

  def new
    @section=Section.new
    @section_count=Section.count + 1
    @pages=Page.sorted
  end
  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice]='Section has been successfully saved!'
      redirect_to(:action=>'index')
    else
      @section_count=Section.count + 1
      @pages=Page.sorted
      render('new')
    end
  end

  def edit
    @section=Section.find(params[:id])
    @section_count=Section.count
    @pages=Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice]='Section has been successfully updated!'
      redirect_to(:action=>'show',:id=>@section.id)
    else
      @section_count=Section.count
      @pages=Page.sorted
      render('new')
    end
  end
  def delete
    @section=Section.find(params[:id])
  end
  def destroy
    section=Section.find(params[:id]).destroy
    flash[:notice]="Section #{section.name} has been successfully destroyed!"
    redirect_to(:action=>'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id,:name,:position,:visible,:content,:content_type)
  end
end
