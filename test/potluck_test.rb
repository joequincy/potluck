require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
  end
  def test_potluck_exists
    assert_instance_of Potluck, @potluck
  end
  def test_date_is_correct
    assert_equal "7-13-18", @potluck.date
  end
  def test_dishes_array_has_correct_contents
    assert_equal [], @potluck.dishes
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@cocktail_meatballs)
    assert_equal [@couscous_salad, @cocktail_meatballs], @potluck.dishes
  end
end
