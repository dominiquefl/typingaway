class TagsController < ApplicationController
  include TagsHelper
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to @tag
    else
      render 'edit'
    end
  end


  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path
  end
end
