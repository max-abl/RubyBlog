class PostsController < ApplicationController

    before_action :set_post, only: [:show , :update, :destroy, :get_comments]

    # GET /posts
    def index
        @posts = Post.all
        render json: @posts, status: :success
    end

    # GET /posts/:id
    def show
        render json: @post, status: :success #200
    end

    # POST /posts
    def create
        @post = Post.new(post_params)
        if @post.save
            render json: @post, status: :created, location: @post
        else
            render json: @post.errors, status: :bad_request #401
        end
    end

    # PUT /posts/:id
    def update
        if @post.update(post_params)
            render json: @post, status: :success
        else
            render json: @post.errors, status: :unprocessable_entity #422
        end
    end

    # DELETE /posts/:id
    def destroy 
        @post.destroy
    end


    # GET /posts/:id/comments
    def get_comments
        render json: @post.comments, status: :success
    end
    

    # ------------- Private -------------
    private 
    
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.permit(:title, :content)
    end

end
