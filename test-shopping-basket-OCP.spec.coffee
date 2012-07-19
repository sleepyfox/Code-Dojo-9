describe 'An empty shopping basket', ->
  it 'should return a total of zero', ->
    myBasket = (new BasketFactory).getEmptyBasket()
    expect(myBasket.isEmpty()).toBe true
    expect(myBasket.total()).toBe 0
  
describe 'A shopping basket with one item in it', ->
  it 'should not be empty', ->
    myBasket = (new BasketFactory).getBasketWithItems()
    myBasket.addItem('Corn Flakes', 99)
    expect(myBasket.isEmpty()).toBe false


class BasketFactory
  constructor: ->

  getEmptyBasket: ->
    new EmptyBasket

  getBasketWithItems: ->
    new BasketWithItems


class EmptyBasket
  constructor: ->
  total: -> 0
  isEmpty: -> true

class BasketWithItems extends EmptyBasket
  items = []

  constructor: ->
    
  addItem: (item) ->
    items.push item

  isEmpty: ->
    if items.length > 0
      false
    else
      true

    