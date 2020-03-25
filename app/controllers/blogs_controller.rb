class BlogsController < ApplicationController
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
    blog = Blog.new(blog_params)
    if params[:back]
      render :new
      if @blog.save
        redirect_to blogs_path, notice: "投稿しました。"
      else
        render :new
      end
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new unless @blog.valid?
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blogs_url, notice: "記事を更新しました。"
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_url, notice: '記事を削除しました。'
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:content, :image)
  end
end
