describe 'The shopping basket', ->
  it 'should return a total of zero if it is empty', ->
    myBasket = new Basket
    expect(0).toEqual myBasket.total

class Basket
	constructor: ->

	total: 0
  