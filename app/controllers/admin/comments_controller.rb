class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.order('id desc').paginate(page: params[:page])
  end

  def destory
    @comment = Comment.find(params[:id])
  end

  def update
    respond_to do |format|
      if Comment.find(params[:id]).update(comment_params)
        format.html { redirect_to admin_comments_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  private
end
