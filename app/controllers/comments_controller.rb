class CommentsController < ApplicationController
   before_action :authenticate_user!, except: [:create]
   before_action :set_post
  
   def create
      @comment = @post.comments.build(comment_params)
      @comment.user = user_signed_in? ? current_user : User.find_by(email: 'anonimo@example.com')

  
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        render :new
      end
   end
  
   private
  
   def set_post
      @post = Post.find(params[:post_id])
      @comments = @post.comments.paginate(page: params[:page], per_page: 4)
   end
  
   def comment_params
      params.require(:comment).permit(:content)
   end
  end
  