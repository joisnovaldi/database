class BooksController < ApplicationController
 
before_action :user_signed_in?

 layout 'admin'
 
  def index
    @books = Book.all
 end
 
 def show
   id = params[:id]
   @book = Book.find(id)
end
 
 def new
   @book = Book.new
 end

 def create
  @book = Book.new(resource_params)
  if @book.save
  flash[:notice] = 'Book has been created'
redirect_to books_path
 else
  render 'new'
 end
end

 def edit
  @book = Book.find(params[:id])
 end

 def update
@book = Book.find(params[:id]) 
@book.update(resource_params)
flash[:notice] = 'Book has been updated'
redirect_to book_path(@book)
end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  flash[:notice] = 'Book has been delete'
  redirect_to book_path
 end

 private

 def resource_params
  params.require(:book).permit(:title, :description, :page, :price)
 end
end
