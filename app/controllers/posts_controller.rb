class PostsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
 before_action :set_post, only: [:show, :edit, :update, :destroy]

 def index
   @posts = Post.includes(:comments).all.paginate(page: params[:page], per_page: 10)
   @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
end

 def show
 end

 def new
    @post = Post.new
 end

 def edit
   @post = Post.find(params[:id])

 end

 def create
    @post = current_user.posts.build(post_params)

    if @post.save
      #Adiciona uma mensagem de sucesso
      flash[:notice] = "Post criado com sucesso!"

      #Redireciona para a pagina de posts
      redirect_to root_path
    else
      render :new
    end
 end

 def update
   @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
 end

 def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
 end

 private

 def set_post
    @post = Post.find(params[:id])
 end

 def post_params
    params.require(:post).permit(:title, :content)
 end
end
