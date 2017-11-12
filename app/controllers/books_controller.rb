class BooksController < ApplicationController

def index

  respond_to do |format|
    format.html
    format.text
    format.csv do
      csv = Book.generate_csv(Book.all)
      render plain: csv
    end
    format.json do
      json = []
      Book.all.each do |book|
        json << {title: book.title, author: book.author}
      end
      render json: json
    end
  end
end

end
