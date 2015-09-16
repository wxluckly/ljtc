class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/travels/#{params[:comment][:travel_id]}#review_area" }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    travel = @comment.travel
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to "/travels/#{travel.id}#review_area" }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :travel_id)
  end

end