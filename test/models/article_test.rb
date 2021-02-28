require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = Article.create(title: "Domi's Test Article")
    @comments = Comment.create(body: "Loren ipsum was the game.",
      commenter: "Jane Doe",
      article: @article
    )
  end

  test "create Article with title" do
    assert Article.create(
      title: "The Greatest Title"
    )
  end

  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "title must be present" do
    @article.title = nil
    refute_predicate @article, :valid?
  end

  test "title must be more than 5 characters" do
    article = Article.new(title: "four")
    assert_not article.save
  end

  test "destroying an article also destroys the comments" do
    assert_difference "Article.count", -1 do
      assert_difference "Comment.count", -1 do
        @article.destroy!
      end
    end
  end
end
