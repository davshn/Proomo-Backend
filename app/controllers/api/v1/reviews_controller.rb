class Api::V1::ReviewsController < ApplicationController
  before_action :set_client
  before_action :set_commerce, only: [:create, :index]
  skip_before_action :verify_authenticity_token
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    page = params[:page]
    if page.to_i <= 0
      return render json: { error: 'INVALD_PAGE_VALUE' }, status: 400
    end
    @reviews = @client.reviews.page(page)
    render json: @reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    begin
      if !Review.exits_review?(@client.id, @commerce.id)
        review = Review.new
        review.client_id = @client.id
        review.commerce_id = @commerce.id
        review.score = params[:score]
        review.reason = params[:reason]
        response = nil
        status = 400

        if review.save
          response = review
          status = 201
        else
          response = { errors: review.errors }
        end
      else
       response = { error: 'Ya tienes una calificacion del comercio' }
      end

      render json: response, status: status
    rescue => exception
      raise
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      @review.score = params[:score]
      @review.reason = params[:reason]
      if @review.save
         render json:  @review
      else
       render json: { errors: @review.errors}, status: :unprocessable_entity
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @client.reviews.find(params[:id]).destroy
      render json: { status: 'deleted' },  status: 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @client.reviews.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])

      if @client.nil?
        return render json: { error: 'unauhtorizade' }, status: 401
      end
    end

    def set_commerce
      @commerce = Commerce.find(params[:commerce_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:reason, :score, :client_id)
    end
end
