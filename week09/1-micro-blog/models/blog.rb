class Blog
  include Enumerable
  attr_reader :title, :description

  def initialize(title, description)
    @title, @description = title, description
    @posts = []
    @next_id = 1
  end

  def each(&block)
    @posts.each &block
  end

  def get(id)
    @posts.select { |post| post.id == id }.first
  end

  def delete(id)
    index = @posts.index { |post| post.id == id }

    @posts.delete_at(index) unless index.nil?
  end

  def add(post)
    post.id = @next_id
    @posts << post

    @next_id += 1
  end

  def posts_containing(tag)
    @posts.select do |post|
      post.title.include?(tag) || post.content.include?(tag)
    end
  end
end
