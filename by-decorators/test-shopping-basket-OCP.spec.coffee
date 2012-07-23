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
    myBasket = (new BasketFactory).getBasket()
    myBasket.addItem('Corn Flakes', 99)
    
  it 'should not be empty', ->
    expect(myBasket.isEmpty()).toBe false

  it 'should have one item in it', ->
    expect(myBasket.numberOfItems()).toBe 1
  
  it 'should have a total of 99', ->
    expect(myBasket.total()).toBe 99
 
describe 'A shopping basket with two items in it', ->
  myBasket = 0

  beforeEach ->
    myBasket = (new BasketFactory).getBasket()
    myBasket.addItem('Corn Flakes', 99)
    myBasket.addItem('Butter', 70)
    
  it 'should not be empty', ->
    expect(myBasket.isEmpty()).toBe false

  it 'should have two items in it', ->
    expect(myBasket.numberOfItems()).toBe 2
  
  it 'should have a total of 169', ->
    expect(myBasket.total()).toBe 169

describe 'A VAT capable shopping basket with two items in it', ->
  myBasket = 0

  beforeEach ->
    myBasket = (new BasketFactory).getBasketWithVAT()
    myBasket.addItem('Corn Flakes', 75)
    myBasket.addItem('Butter', 25)
    
  it 'should not be empty', ->
    expect(myBasket.isEmpty()).toBe false

  it 'should have two items in it', ->
    expect(myBasket.numberOfItems()).toBe 2
  
  it 'should have a total (with VAT) of 120', ->
    expect(myBasket.total()).toBe 120

describe 'A Delivery capable shopping basket with two items in it', ->
  myBasket = 0

  beforeEach ->
    myBasket = (new BasketFactory).getBasketWithDelivery()
    myBasket.addItem('Corn Flakes', 75)
    myBasket.addItem('Butter', 25)
    
  it 'should not be empty', ->
    expect(myBasket.isEmpty()).toBe false

  it 'should have two items in it', ->
    expect(myBasket.numberOfItems()).toBe 2
  
  it 'should have a total (with delivery) of 450', ->
    expect(myBasket.total()).toBe 450

describe 'A Delivery and VAT capable shopping basket with two items in it', ->
  myBasket = 0

  beforeEach ->
    myBasket = (new BasketFactory).getBasketWithVATAndDelivery()
    myBasket.addItem('Corn Flakes', 75)
    myBasket.addItem('Butter', 25)
  
  it 'should not be empty', ->
    expect(myBasket.isEmpty()).toBe false

  it 'should have two items in it', ->
    expect(myBasket.numberOfItems()).toBe 2
  
  it 'should have a total with VAT and Delivery of 540', ->
    expect(myBasket.total()).toBe 540


