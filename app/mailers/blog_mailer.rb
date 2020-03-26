class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    mail to: "kiriha5123@yahoo.co.jp", subject: "InstaClone投稿確認メール"
  end
end