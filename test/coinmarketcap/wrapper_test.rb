require "./test/test_helper"

class Coinmarketcap::WrapperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Coinmarketcap::Wrapper::VERSION
  end

  def test_exists
    assert Coinmarketcap::Wrapper
  end

  def test_it_gives_back_a_coin
    VCR.use_cassette('one_coin') do
      coin = Coinmarketcap::Wrapper::Coin.find('bitcoin')
      assert_equal Coinmarketcap::Wrapper::Coin, coin.class

      # Check that the fields are accessible by our model
      assert_equal 'bitcoin', coin.id
      assert_equal "Bitcoin", coin.name
      assert_equal "BTC", coin.symbol
    end
  end

  def test_it_gives_back_all_the_coins
    VCR.use_cassette('all_coins') do
      result = Coinmarketcap::Wrapper::Coin.all

      # Make sure that the JSON was parsed
      assert result.kind_of?(Array)
      assert result.first.kind_of?(Coinmarketcap::Wrapper::Coin)
    end
  end
end
