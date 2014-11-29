class CommentsController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]


  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.item_id = @item.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to item_url(@item), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to item_url(@item), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to item_url(@item), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def check_user
      unless (@comment.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this comment belongs to someone else"
      end
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
