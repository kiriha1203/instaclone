class BlogsController < ApplicationController
  before_action :check_login_ore_kick_session
  before_action :set_authentication, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(created_at: "DESC")
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        BlogMailer.blog_mail(@blog).deliver
        redirect_to root_path, notice: "投稿しました。"
      else
        render :new
      end
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new unless @blog.valid?
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_url, notice: "記事を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: '記事を削除しました。'
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:content, :image)
  end

  def set_authentication
    @blog = Blog.find(params[:id])
    unless current_user == @blog.user
      redirect_to blogs_path, notice: "ユーザーが違います"
    end
  end

  def check_login_ore_kick_session
    unless logged_in?
      redirect_to new_session_url
    end
  end
end
