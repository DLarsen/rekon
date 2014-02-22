class Dependency

  def initialize(definition)
    @definition = definition
  end

  def fulfilled_for_replies(replies)
    parts = @definition.split(' ')

    i = 0
    fulfilled = true
    loop do

      this_fullfilled = false
      p = parts[i]
      j = 0
      loop do
        r = replies[j]
        this_fullfilled = Dependency.reply_passes_part(r,p)
        j += 1
        break if j >= replies.length || this_fullfilled
      end

      # everything has to be fulfilled right now... an implict AND
      fulfilled = fulfilled && this_fullfilled

      i += 1
      break if (i >= parts.size || fulfilled)
    end

    fulfilled

  end

  private

  def self.tokens_for(part)
    part.split(":")
  end

  def self.reply_passes_part(reply,part)
    type, slug, condition = Dependency.tokens_for(part)

    return false if (reply.prompt.slug != slug)

    if (condition == "*")
      reply.complete?
    elsif (condition == "yes")
      reply.answer == "yes"
    elsif (condition == "no")
      reply.answer == "no"
    else
      raise "This will not work... unrecognized condition: #{condition}"
    end

  end

  def self.tests
    puts Dependency.test1 ? "PASS" : "FAIL"
    puts !Dependency.test2 ? "PASS" : "FAIL"
  end

  def self.test1
    p = Prompt.new(slug:'a')
    d = Dependency.new("p:a:*")
    d.fulfilled_for_replies([
      Reply.new(answer:"Anything", prompt: p)
      ])
  end

  def self.test2
    p = Prompt.new(slug:'b')
    d = Dependency.new("p:a:*")
    d.fulfilled_for_replies([
      Reply.new(answer:"Anything", prompt: p)
      ])
  end
end