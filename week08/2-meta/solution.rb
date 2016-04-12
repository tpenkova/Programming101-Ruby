class Object

  def singleton_class
    class << self
      self #Object.singleton class
    end
  end


  def define_singleton_method(name, &block)
    singleton_class.send(:define_method, name, &block)
  end
end


class String

  def to_proc
    proc do |item|
      split('.').each do |function|
        item = item.public_send(function)
      end
      item
    end
  end

end

class Module
  def private_attr_accessor(*args)
    private_attr_reader(*args)
    private_attr_writter(*args)
  end

  def private_attr_reader(*args)
    args.each do |arg|
      class_eval("private def #{arg}; @#{arg}; end")
    end
  end

  def private_attr_writter(*args)
    args.each do |arg|
      class_eval("private def #{arg}=(val); @#{arg}=val; end")
    end
  end

  def private_attr_writter2(*name)
    name.each do |n|
      define_method("#{n}=") { instance_variable_set("#{n}", n) }

      private n
    end
  end
end

#На map-a трябва да подадем proc, за това съзадаваме to_proc
p [2, 3, 4, 5].map(&'succ.succ')
# class Symbol
#   def to_proc
#     proc { |arg, *args| arg.public_send(self, *args)}
#   end
# end

# (1..5).map(&"next.next")
# (1..5).map{ |n| n.next.next}
# (1..5).map{ |n| result = n.next; result.next}


foo = Object.new
foo.define_singleton_method(:cold) { p "It's cold"}

foo2 = Object.new


foo.cold
#foo2.cold


class TestClass
  private_attr_accessor :bar

  def some_public_method_working_with_bar
    bar + 42
  end
end

t = TestClass.new

t.send(:bar= , 42)
p t.send(:bar)

p t.some_public_method_working_with_bar


class Module

    def cattr_accessor(*args, &block)
        cattr_reader(*args, &block)
        cattr_writter(*args, &block)
    end

    def cattr_writter(*args, &block)
      singleton_class.class_eval do
        args.each do |arg|

          define_method("#{arg}=") { |other| class_variable_set("@@#{arg}", block ? block.call : other)}
        end
      end
    end

    def cattr_reader(*args, &block)
      singleton_class.class_eval do
        args.each do |arg|
          define_method(arg) { class_variable_get("@@#{arg}") }
        end
      end
    end

    def delegate(name, to:)
	instance_eval do
	define_method(name) do |*args, &block|
	instance_variable_get(to).send(name)
        end
      end
    end

end



------------------Тестване на методи----------------
class Invoice
delegate: first_name, to: '@user'
delegate: last_name, to: '@user'

def initialize(user)
@user = user
end
end

invoice - Invoice.new(user)

class TestClass
  cattr_accessor(:plugins) { []
  }
  # plugins = 42
end

#Първо викам set после get
t = TestClass
t.plugins = 42
p t.plugins
#yield винаги ще очаква блок, а не трябва
# p TestClass.plugins == []
#TestClass.plugins << SomePlugin.new


