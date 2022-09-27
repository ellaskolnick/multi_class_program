class Contacts
  def initialize(diary)
    # initialized with an instance of diary to access the contacts in the entries
    @diary = diary
    @phone_numbers = []
  end

  def all
    # lists all of the phone numbers found in all of the diary entries
    searching_for_numbers
    @phone_numbers
  end

  private

  def store_phone_number(entry)
    @phone_numbers << entry.contents.match(/\d{11}/)[0]
  end

  def has_number?(entry)
    entry.contents.match?(/\d{11}/)
  end

  def searching_for_numbers
    @diary.entries.each do |entry|
      if has_number?(entry)
        store_phone_number(entry)
      end
    end
  end
end
