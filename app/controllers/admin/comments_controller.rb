class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.order('id desc').paginate(page: params[:page])
  end

  def destroy
    Comment.find(params[:id]).destroy
    render js: 'location.reload();'
  end
end
