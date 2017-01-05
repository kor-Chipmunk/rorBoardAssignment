class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @Posts = Post.all.order(created_at: :desc)
  end

  def new
  end

  def create
    title = params[:title]
    detail = params[:detail]
    
    post = Post.new
    post.title = title
    post.detail = detail
    if post.save
      flash[:success] = "게시글을 생성하셨습니다!"
      redirect_to '/'
    else
      flash[:alert] = "게시글 생성에 실패하였습니다!"
      redirect_to '/'
    end
  end

  def show
    post_id = params[:post_id]
    post = Post.find(post_id)

    @title = post.title
    @detail = post.detail
  end

  def edit
    post_id = params[:post_id]
    post = Post.find(post_id)
    
    @title = post.title
    @detail = post.detail
  end

  def update
    post_id = params[:post_id]
    title = params[:title]
    detail = params[:detail]

    post = Post.find(post_id)
    post.title = title
    post.detail = detail
    
    if post.update
      flash[:success] = "게시글을 수정하셨습니다!"
      redirect_to '/show/' + post_id
    else
      flash[:alert] = "게시글 수정에 실패하였습니다!"
      redirect_to '/show/' + post_id
    end
end

  def destroy
    post_id = params[:post_id]
    post = Post.find(post_id)
    
    if post.destroy
      flash[:success] = "게시글을 삭제하셨습니다!"
      redirect_to '/'
    else
      flash[:alert] = "게시글 삭제에 실패하였습니다!"
      redirect_to '/'
    end
  end
end
