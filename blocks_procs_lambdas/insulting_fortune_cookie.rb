class InsultingFortuneCookie
  def reader(fortune)
    puts "*crack* (you broke the fortune cookie)"
    yield(fortune)
    puts "*crinkle crinkle* (you crush and throw away the lousy fortune)\n\n"
  end
end

@fortune_cookie = InsultingFortuneCookie.new
@fortune_cookie.reader("You find beauty in ordinary things, do not lose this ability") { |fortune| puts fortune + " Lord knows you need it"}
@fortune_cookie.reader("Fame, riches and romance are yours for the asking") { |fortune| puts fortune + " just don't wait for an answer"}
@fortune_cookie.reader("Your greatest fortune is the large number of friends you have") { |fortune| puts fortune + " in bed"}