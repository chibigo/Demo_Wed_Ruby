class CommentsController < ApplicationController

  def create
    # render json: params
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(comment_params)
    if @comment.save
      flash[:success] = "Comment successfully"
      redirect_to request.referrer || root_url
    else
      flash.now[:danger] = "error"
    end
  end

  def new
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(parent_id: params[:parent_id])
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      # Handle a successful update.
      flash[:success] = "Updated successfully"
      redirect_to request.referrer || root_url
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  private
    def comment_params
      params.require(:comment).permit(:body, :parent_id,:micropost_id,:user_id)
    end
end     
