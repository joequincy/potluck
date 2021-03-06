require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @bean_dip = Dish.new("Bean Dip", :appetizer)
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
  def test_getting_dishes_by_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    appetizers = @potluck.get_all_from_category(:appetizer)
    entres = @potluck.get_all_from_category(:entre)
    desserts = @potluck.get_all_from_category(:dessert)
    assert_equal [@couscous_salad, @summer_pizza], appetizers
    assert_equal @couscous_salad, appetizers.first
    assert_equal "Couscous Salad", appetizers.first.name
    assert_equal [@roast_pork, @cocktail_meatballs], entres
    assert_equal [@candy_salad], desserts
  end
  def test_menu_outputs_correct_contents
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    @potluck.add_dish(@bean_dip)
    expectation = {
      :appetizers => ["Bean Dip", "Couscous Salad", "Summer Pizza"],
      :entres => ["Cocktail Meatballs", "Roast Pork"],
      :desserts => ["Candy Salad"]
    }
    menu = @potluck.menu
    assert_equal expectation[:appetizers], menu[:appetizers]
    assert_equal expectation[:entres], menu[:entres]
    assert_equal expectation[:desserts], menu[:desserts]
  end
  def test_ratio_of_dish_type_to_total
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    @potluck.add_dish(@bean_dip)
    assert_equal 50.0, @potluck.ratio(:appetizer)
    assert_equal 33.3, @potluck.ratio(:entre)
    assert_equal 16.7, @potluck.ratio(:dessert)
  end
end
