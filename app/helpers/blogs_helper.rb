module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_blogs_path
    elsif action_name == 'edit'
      blog_path
    end
  end

  def favorite_method
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
end
