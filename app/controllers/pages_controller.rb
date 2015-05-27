class PagesController < ApplicationController
  layout "admin"
  def index
    @pages=Page.sorted
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count=Page.count + 1
    @subjects=Subject.sorted

  end
  def create
    @page=Page.create(page_params)
    if @page.save
      flash[:notice]='Page was successfully created'
      redirect_to(:action=>'index')
    else
      @page_count=Page.count + 1
      @subjects=Subject.sorted
      render('new')
    end
  end

  def edit
    @page=Page.find(params[:id])
    @page_count= Page.count
    @subjects=Subject.sorted
  end
  def update
    @page=Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice]='Page was successfully updated'
      redirect_to(:action=>'show',:id=>@page.id)
    else
      @page_count=Page.count
      @subjects=Subject.sorted
      render('edit')
    end
  end
  def delete
    @page=Page.find(params[:id])
  end
  def destroy
    page =Page.find(params[:id]).destroy
    flash[:notice]="Page #{page.name} has been successfully destroyed"
    redirect_to(:action=>'index')
  end
  private

  def page_params
    params.require(:page).permit(:subject_id,:name,:position,:permalink,:visible)
  end
end
