describe 'The shopping basket', ->
  it 'should return a total of zero if it is empty', ->
    basketFactory = new BasketFactory()
    myBasket = basketFactory.getBasket()
    expect(0).toBe myBasket.total()
  
class BasketFactory
  constructor: ->

  getBasket: ->
    return(new Basket)

class Basket
  constructor: ->
  total: -> 0
