class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
  end

  def create
    post = Post.new(post_params)
   
    if post.save
      flash[:success] = "게시글을 생성하셨습니다!"
      redirect_to posts_path
    else
      flash[:alert] = "게시글 생성에 실패하였습니다!"
      redirect_to posts_path
    end
  end

  def show
    post = post_by_id

    @title = post.title
    @detail = post.detail
  end

  def edit
    @post = post_by_id
  end

  def update
    post = post_by_id
    
    if post.update(post_params)
      flash[:success] = "게시글을 수정하셨습니다!"
      redirect_to post_path(post)
    else
      flash[:alert] = "게시글 수정에 실패하였습니다!"
      redirect_to post_path(post)
    end
end

  def destroy
    post = post_by_id
    
    if post.destroy
      flash[:success] = "게시글을 삭제하셨습니다!"
      redirect_to posts_path
    else
      flash[:alert] = "게시글 삭제에 실패하였습니다!"
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :detail)
  end

  def post_by_id
    Post.find(params[:id])
  end
end
