class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_unprocessable_entity
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def rescue_with_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
  
end
