module Sass::Script::Functions
  def random(*args)
    case args.size
    when 1
      limit = args[0]
    else
      limit = Sass::Script::Number.new(100)
    end

    assert_type limit, :Number, :limit

    random_number = rand(limit.value)

    return Sass::Script::Number.new(random_number)
  end
end