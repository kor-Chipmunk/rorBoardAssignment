class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post_id = params[:post_id]

    comment = Comment.new
    comment.detail = params[:detail]
    comment.post_id = post_id

    if comment.save
      flash[:success] = "댓글을 쓰셨습니다!"
      redirect_to '/posts/' + post_id + '/'
    else
      flash[:alert] = "댓글 생성에 실패하였습니다!"
      redirect_to '/posts/' + post_id + '/'
    end
  end

  def update
    comment = Comment.find(params[:comment_id])
    comment.detail = params[:detail]

    if comment.update
      flash[:success] = "댓글을 수정하셨습니다!"
      redirect_to '/posts/' + post_id + '/'
    else
      flash[:alert] = "댓글 수정에 실패하였습니다!"
      redirect_to '/posts/' + post_id + '/'
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id])

    if comment.destroy
      flash[:success] = "댓글을 삭제하셨습니다!"
      redirect_to '/posts/' + post_id + '/'
    else 
      flash[:alert] = "댓글 삭제에 실패하셨습니다!"
      redirect_to '/posts/' + post_id + '/'
    end
  end
end
