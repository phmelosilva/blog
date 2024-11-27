class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    end
  
    private
      def comment_params
        # params.expect(comment: [:commenter, :body, :status]) -> Método que estava no Tutorial, abaixo é o método correto
        params.require(:comment).permit(:commenter, :body, :status)
      end
  end
  