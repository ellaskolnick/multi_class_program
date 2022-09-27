# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
  Diary
  - add (entry)
  - all
  - word_count (private method)
  - read_perfect_amount (wpm, minutes)
└───────────┬────────────────┘
            │
            │ owns
            ▼
┌─────────────────────────┐
  Diary Entries
  - title
  - contents
  - word_count
└─────────────────────────┘


┌─────────────────────────┐
  Contacts
  - diary
  - all
└─────────────────────────┘

┌─────────────────────────┐
  Todo
  - task
└─────────────────────────┘

┌─────────────────────────┐
  TodoList
  - add (todo)
  - all
└─────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  end

  def add(entry)
  # add an instance of diary entry to diary
  end

  def all
  # see all of the diary entries
  end

  def read_perfect_amount(wpm, minutes)
  # selects a diary entry based on wpm and mins
  end
end

class DiaryEntry
  attr_reader :title, :contents
  def initialize(title, contents)
    #title and contents
  end

  # def word_counter
  # # counts how many words in an entry
  # end
end

class Contacts
  def initialize(diary)
  # initialized with an instance of diary to access the contacts in the entries
  end

  def all
  # lists all of the phone numbers found in all of the diary entries
  end
end

class Todo
  def initialize(task)
    # initialized with a string of class
  end
end

class TodoList
  def initialize
  end

  def add(todo)
  # add todo to todo list
  end

  def all
  # lists all of the todos
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# reads all of the diary entries
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary.add(diary_entry)
diary.all # => [diary_entry]

diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary_entry2 = DiaryEntry.new("1", "one two three for five")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.all # => [diary_entry, diary_entry2]

# returns the perfect diary entry to read
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary_entry2 = DiaryEntry.new("2", "one two three four five")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.read_perfect_amount(1, 4) # => diary_entry

# returns the longest perfect diary entry to read
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary_entry2 = DiaryEntry.new("1", "one two three four five")
diary_entry3 = DiaryEntry.new("1", "one two")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
diary.read_perfect_amount(1, 4) # => diary_entry

# returns nil if there is no amount that fits
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary_entry2 = DiaryEntry.new("1", "one two three four five")
diary_entry3 = DiaryEntry.new("1", "one two three")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
diary.read_perfect_amount(1, 2) # => nil

# fails wpm is smaller than or equal to 0
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary_entry2 = DiaryEntry.new("1", "one two three four five")
diary_entry3 = DiaryEntry.new("1", "one two three")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
diary.read_perfect_amount(0, 5) # => "WPM cannot be zero or smaller."

# returns all contacts found in the diary
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary_entry2 = DiaryEntry.new("1", "one two three four five 07777777777")
diary_entry3 = DiaryEntry.new("1", " 07777222938 one two three")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
contacts = Contacts.new(diary)
contacts.all # => ["07777777777", "07777222938"]

# returns an empty contacts list
diary = Diary.new
diary_entry = DiaryEntry.new("1", "hi, how are you?")
diary.add(diary_entry)
contacts = Contacts.new(diary)
contacts.all # => []

# returns all the todos
todo_list = TodoList.new
todo = Todo.new("eat")
todo_list.add(todo)
todo_list.all # => [todo]

# returns all the todos
todo_list = TodoList.new
todo = Todo.new("eat")
todo2 = Todo.new("drink")
todo_list.add(todo)
todo_list.add(todo2)
todo_list.all # => [todo, todo2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# returns an empty diary if diary is emtpy
diary = Diary.new
diary.all # => []

# nil if there are no entries
diary = Diary.new
diary.read_perfect_amount(3, 5) # => nil

# diary entry title returns the title
diary_entry = DiaryEntry.new("1", "one")
diary_entry.title # => "1"

# diary entry contents returns the contents
diary_entry = DiaryEntry.new("1", "one")
diary_entry.contents # => "one"

# returns empty todo list
todo_list = TodoList.new
todo_list.all # => []

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
