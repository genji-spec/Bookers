class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @bookn = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @bookn = Book.new(books_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @bookn.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@bookn.id)
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'Book was successfully destroyed.'
      redirect_to books_path
    else
    end
  end

private
  def books_params
    params.require(:book).permit(:title,  :body)
  end
end
