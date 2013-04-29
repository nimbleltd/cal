class LinkedListItem
  include Comparable
  attr_reader :next_list_item
  attr_accessor :payload

  def initialize( payload )
    @payload = payload
  end

  def next_list_item= (linked_list_item)
    #help with ArgumentError http://stackoverflow.com/questions/2843255/how-to-test-that-invalid-arguments-raise-an-argumenterror-exception-using-rspec
    if linked_list_item == self
      raise(ArgumentError, "Can not link to self")
    else
      #Go to the next item in the list
      @next_list_item=linked_list_item
    end
  end

  def last?
    #if next list item is nil return true
    next_list_item.nil?
  end

  def === other_item
    self.object_id == other_item.object_id
  end

  def <=> other
    # Comparators return -1, 0, or 1 to indicate > , ==, or <
    # Precedence: integers, then strings, then symbols (each sorted
    # individually)
    if self.payload.class == other.payload.class
      # I implemented this basic comparison for you.
      return self.payload <=> other.payload
    end

    ## You will have to implement the logic for what to do to compare types that aren't equal.
    class_of_first = self.payload.class
    class_of_other = other.payload.class
    #Symbol vs String
    if class_of_first == Symbol && class_of_other == String
      1
    elsif class_of_first == String && class_of_other == Symbol
      -1
    elsif class_of_first == Symbol && class_of_other == Symbol
      0
    elsif class_of_first == String && class_of_other == String
      0
    # Fixnum vs String
    elsif class_of_first == Fixnum && class_of_other == String
      -1
    elsif class_of_first == String && class_of_other == Fixnum
      1
    elsif class_of_first == Fixnum && class_of_other == Fixnum
      0
    elsif class_of_first == String && class_of_other == String
      0
    # Fixnum vs String
    elsif class_of_first == Fixnum && class_of_other == Symbol
      -1
    elsif class_of_first == Symbol && class_of_other == Fixnum
      1
    end
  end

end
