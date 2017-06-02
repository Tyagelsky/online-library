class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy,:edit]
  before_action :require_admin, except: [:index,:show]

  def index
    @books = Book.paginate(page: params[:page],per_page: 5)
  end

  def show

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "The book was successfuly created"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @book.update(book_params)
      flash[:success] = "The book was successfuly edited"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "The book was successfuly deleted"
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name,:description,:avatar,:authors, category_ids: [])
  end

  def require_admin
   if  !current_user.admin?
     redirect_to books_path
   end
  end

end
