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

exports.BasketFactory = BasketFactory
exports.EmptyBasket = EmptyBasket
exports.BasketWithItems = BasketWithItems
