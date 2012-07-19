describe 'The shopping basket', ->
  it 'should return a total of zero if it is empty', ->
    myBasket = (new BasketFactory).getBasket()
    expect(myBasket.isEmpty()).toBe true
    expect(myBasket.total()).toBe 0
  
class BasketFactory
  constructor: ->

  getBasket: ->
    new Basket

class Basket
  constructor: ->
  total: -> 0
  isEmpty: -> true
