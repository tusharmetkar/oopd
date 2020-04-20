gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative '../lib/bottles'

class BottlesTest < Minitest::Test
  def test_the_first_verse
    expected = <<-VERSE
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.
VERSE
    assert_equal expected, ::Bottles.new.verse(99)
  end

  def test_another_verse
    expected = <<-VERSE
89 bottles of beer on the wall, 89 bottles of beer.
Take one down and pass it around, 88 bottles of beer on the wall.
VERSE
    assert_equal expected, ::Bottles.new.verse(89)
  end

  def test_verse_3
    expected = <<-VERSE
3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.
    VERSE
    assert_equal expected, ::Bottles.new.verse(3)
  end

  def test_verse_2
    expected = <<-VERSE
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
    VERSE
    assert_equal expected, ::Bottles.new.verse(2)
  end

  def test_verse_1
    expected = <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
    assert_equal expected, ::Bottles.new.verse(1)
  end

  def test_verse_0
    expected = <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
    assert_equal expected, ::Bottles.new.verse(0)
  end

  def test_a_couple_verses
    expected = <<-VERSES
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.
VERSES
    assert_equal expected, ::Bottles.new.verses(99, 98)
  end

  def test_a_few_verses
    expected = <<-VERSES
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSES
    assert_equal expected, ::Bottles.new.verses(2, 0)
  end

  def test_the_whole_song
    bottles = Bottles.new
    expected = 99.downto(0).collect {|i| bottles.verse(i)}.join("\n")
    assert_equal expected, bottles.song
  end

end
