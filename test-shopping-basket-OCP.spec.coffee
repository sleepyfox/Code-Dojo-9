basket = require './shopping-basket'
BasketFactory = basket.BasketFactory

describe 'An empty shopping basket', ->
  it 'should return a total of zero', ->
    myBasket = (new BasketFactory).getEmptyBasket()
    expect(myBasket.isEmpty()).toBe true
    expect(myBasket.total()).toBe 0
  
describe 'A shopping basket with one item in it', ->
  myBasket = 0

  beforeEach ->
    myBasket = (new BasketFactory).getBasketWithItems()
    myBasket.addItem('Corn Flakes', 99)
    
  it 'should not be empty', ->
    expect(myBasket.isEmpty()).toBe false

  it 'should have one item in it', ->  
    expect(myBasket.numberOfItems()).toBe 1
  
  it 'should have a total of 99', ->
    expect(myBasket.total()).toBe 99
 