class Owner
  attr_reader :species
  attr_accessor :name, :pets
  attr_writer :mood
  @@all=[]
  def initialize(owner)
    @owner=owner
    @@all << self
    @species="human"
    @pets= {:fishes=>[], :dogs=>[],:cats=>[]}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all=[]
  end

  def self.count
    @@all.count
  end

  def say_species
    return "I am a human."
  end

  def buy_fish(name)
    name= Fish.new("Bubbles")
    @pets[:fishes]<<name
    return @pets

  end

  def buy_cat(name)
    name= Cat.new("Crookshanks")
    @pets[:cats]<<name
    return @pets
  end

  def buy_dog(name)
    name= Dog.new("Snuffles")
    @pets[:dogs]<<name
    return @pets
  end

  def walk_dogs
    @pets[:dogs].first.mood = "happy"
  end

  def play_with_cats
    @pets[:cats].first.mood = "happy"
  end

  def feed_fish
    @pets[:fishes].first.mood = "happy"
  end

  def sell_pets
    @pets[:fishes].each do |pet|
      pet.mood = "nervous"
    end
    @pets[:fishes].clear
    @pets[:cats].each do |pet|
      pet.mood = "nervous"
    end
    @pets[:cats].clear
    @pets[:dogs].each do |pet|
      pet.mood = "nervous"
    end
    @pets[:dogs].clear
  end

  def list_pets
    @fish_count=@pets[:fishes].length
    @cat_count=@pets[:cats].length
    @dog_count=@pets[:dogs].length
    return "I have #{@fish_count} fish, #{@dog_count} dog(s), and #{@cat_count} cat(s)."
  end
end
