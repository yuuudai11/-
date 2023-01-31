class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
    @books = Book.all
  end

# 以下を追加
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully craeted."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy# データ（レコード）を削除
    redirect_to book_all_path# 投稿一覧画面へリダイレクト
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end