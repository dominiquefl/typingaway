module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :description, :tag_list)
  end
end
