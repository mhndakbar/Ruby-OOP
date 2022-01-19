class Storeitem
  attr_accessor :title, :price
  def initialize
  end
end

class Book < Storeitem
  attr_accessor :author, :pages, :isbn
  def initialize
  end
end

class Magazine < Storeitem
  attr_accessor :publisher, :date
  def initialize
  end
end

fileBook = File.readlines("Book.txt").map(&:chomp)
books = []
fileBook.each do |n|
  book0 = Book.new()
  book0.title, book0.price, book0.author, book0.pages, book0.isbn = n.split(",")
  books<<book0
end

fileMagazine = File.readlines("Magazine.txt").map(&:chomp)
magazines = []
fileMagazine.each do |n|
  magazine0 = Magazine.new()
  magazine0.title, magazine0.price, magazine0.publisher, magazine0.date = n.split(",")
  magazines<<magazine0
end



def addBook
  book1 = Book.new()
  Shoes.app do
    background brown
    stack do
      para "Enter book title", stroke: white
      title = edit_line
      para "Enter price ", stroke: white
      price = edit_line
      para "Enter author ", stroke: white
      author = edit_line
      para "Enter pages ", stroke: white
      pages = edit_line
      para "Enter isbn", stroke: white
      isbn = edit_line
      button "Save " do
        book1.title = title.text
        book1.price = price.text
        book1.author = author.text
        book1.pages = pages.text
        book1.isbn = isbn.text 
        temp = "\n#{book1.title}, #{book1.price}, #{book1.author}, #{book1.pages}, #{book1.isbn}"
        file = File.open("Book.txt", "a")
        file.write(temp)
        file.close
        close()
      end
    end
  end
end

def addMagazine
  magazine1 = Magazine.new()
  Shoes.app do
    background brown
    stack do
      para "Enter book title", stroke: white
      title = edit_line
      para "Enter price ", stroke: white
      price = edit_line
      para "Enter publisher", stroke: white
      publisher = edit_line
      para "Enter date ", stroke: white
      date = edit_line
      button "Save" do
        magazine1.title = title.text
        magazine1.price = price.text
        magazine1.publisher = publisher.text
        magazine1.date = date.text
        temp = "\n#{magazine1.title},#{magazine1.price},#{magazine1.publisher},#{magazine1.date}"
        file = File.open("Magazine.txt", "a")
        file.write(temp)
        file.close
        close()
      end
    end
  end
end

def mostExpensive(books, magazines)
  Shoes.app do
    stack do
      books.each do |n|
        if n.price.to_i > 1000
          para "Books:- "
          para "#{n.title} price: #{n.price}"
        end
      end
    end
  end
end

def certainRange(books)
  Shoes.app do
    background brown
    stack do
      para "Enter max", stroke: white
      max = edit_line
      para "Enter min", stroke: white
      min = edit_line
      button "Go!" do
        showRange(max.text, min.text, books)
        close()
      end
    end
  end
end

def showRange(max, min, books)
  Shoes.app do 
    stack do
      books.each do |b|
        if b.price.to_i < max.to_i and b.price.to_i > min.to_i
          para "#{b.title}"
        end
      end
    end
  end
end

def searchByDate(magazines)
  Shoes.app do
    background brown
    stack do
      para "Enter date", stroke: white
      date = edit_line
      button "Go!" do
        showMagazineByDate(date.text, magazines)
        close()
      end
    end
  end
end

def showMagazineByDate(date, magazines)
  Shoes.app do 
    stack do
      magazines.each do |m|
        if m.date == date
          para "#{m.title}"
        end
      end
    end
  end
end

def searchByPublisher(magazines)
  Shoes.app do
    background brown
    stack do
      para "Enter publisher", stroke: white
      publisher = edit_line
      button "Go!" do
        showMagazineByPublisher(publisher.text, magazines)
        close()
      end
    end
  end
end

def showMagazineByPublisher(publisher, magazines)
  Shoes.app do 
    stack do
      magazines.each do |m|
        if m.publisher == publisher
          para "#{m.title}"
        end
      end
    end
  end
end

def showAllItems(magazines, books)
  Shoes.app do 
    stack do
      para "Books:- "
      books.each do |b|
        para "\n#{b.title} #{b.price} #{b.author} #{b.pages} #{b.isbn}"
      end
      para "Magazines:- "
      magazines.each do |m|
        para "\n#{m.title},#{m.price},#{m.publisher},#{m.date}"
      end
    end
  end
end

Shoes.app width: 300, height: 500 do
    background blue
  
    stack do
      para "Book Store", stroke: white
      button "Add store item" do 
        Shoes.app width: 300, height: 300 do
          background blue
          stack do 
            button "Add Book" do
              addBook()
              close()
            end
            button "Add Magazine" do
              addMagazine()
              close()
            end
          end
        end
      end
      button "List most expensive items" do mostExpensive(books, magazines) end
      button "List books within certain range" do certainRange(books) end
      button "Search magazine by date" do searchByDate(magazines) end
      button "Search magazine by publisher" do searchByPublisher(magazines) end
      button "List all of store items" do showAllItems(magazines, books) end
      button "Delete an item"
    end
  end