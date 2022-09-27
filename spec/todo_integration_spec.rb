require 'todo'
require 'todo_list'

RSpec.describe "Todo List Intergration" do
  context "when there is one todo" do
    it "returns the todo" do
    todo_list = TodoList.new
    todo = Todo.new("eat")
    todo_list.add(todo)
    expect(todo_list.all).to eq [todo]
    end
  end

  context "when there are many todos" do
    it "returns all the todos" do
      todo_list = TodoList.new
      todo = Todo.new("eat")
      todo2 = Todo.new("drink")
      todo_list.add(todo)
      todo_list.add(todo2)
      expect(todo_list.all).to eq [todo, todo2]
    end
  end
end
