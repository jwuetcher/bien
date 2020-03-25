class ReviewsController < ApplicationController
    def index
        #this is our list page for the reviews
        @number = rand(100)

        @reviews = Review.all
    end

    def new
        #the form for adding a new review
        @review = Review.new
    end

    def create
        #take info from form and add to the database
        @review = Review.new(form_params)

        #save this to the database
        @review.save
        #redirect back to the homepage
        redirect_to root_path
    end

    def show
        #individual review page
        @review = Review.find(params[:id])
    end

    def destroy
        #find the individual review, then destroy it, and redirect to home
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to root_path
    end

    def edit
        @review = Review.find(params[:id])
        
    end

    def update
        #find the review
        @review = Review.find(params[:id])
        #update with new info from form
        @review.update(form_params)
        #redirect somewhere
        redirect_to review_path(@review)
    end

    def form_params
        params.require(:review).permit(:title, :body, :score)
    end
end
