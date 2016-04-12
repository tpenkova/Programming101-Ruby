class Post
  attr_accessor :id, :title, :content

  def initialize(title, content)
    @title, @content = title, content
  end
end
