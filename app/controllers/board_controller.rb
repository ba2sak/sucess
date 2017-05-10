class BoardController < ApplicationController
  def index
        @view_list = Post.all
  end
  def new
  end
  def create
    
     @email_write = params[:editor]
     @title_write = params[:title]
     @content_write = params[:content]
     
     board_write = Post.new
     board_write.editor = @email_write
     board_write.title = @title_write
     board_write.content = @content_write
     board_write.save
     
     redirect_to '/index'
     
  end
  def show
   @show_list = Post.find(params[:post_id])
  end
  def delete
    remove_list = Post.find(params[:post_id])
    remove_list.destroy
    
    redirect_to '/index'
  end
  def edit
   @update_view = Post.find(params[:post_id])
  end
  def update
    upd_post = Post.find(params[:post_id])
    upd_post.title = params[:title]
    upd_post.content = params[:content]
    upd_post.editor = params[:editor]
    upd_post.save
    
    redirect_to '/index'
  end
end
