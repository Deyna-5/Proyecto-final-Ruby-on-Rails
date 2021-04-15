class CommentsController < ApplicationController
       before_action :find_comment, only: [:destroy]

       def new
              @comment = Comment.new
       end

       def create
              @comment = Comment.new(comment_params)
              respond_to do |format|
                     if @comment.save
                            format.js {}
                     end
              end
       end

       def destroy
              @comment.destroy
              respond_to do |format|
                     format.js {}
              end
       end

       private
              def comment_params
                     params.permit(:user_id, :product_id, :text)
              end

              def find_comment
                     @comment = Comment.find(params[:id])
              end
end