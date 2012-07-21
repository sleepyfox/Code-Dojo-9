class BasketFactory
  constructor: ->

  getEmptyBasket: ->
    new EmptyBasket

  getBasketWithItems: ->
    new BasketWithItems

  getVATBasketWithItems: ->
    new VATBasketWithItems

  getDeliveryVATBasketWithItems: ->
    new DeliveryVATBasketWithItems

class EmptyBasket
  constructor: ->
  total: -> 0
  isEmpty: -> true

class BasketWithItems extends EmptyBasket
  constructor: ->
    @items = []

  addItem: (name, price) ->
    @items.push {name: name, price: price}

  numberOfItems: ->
    @items.length

  total: ->
    sum = 0
    sum += item.price for item in @items
    sum
    
  isEmpty: ->
    @items.length is 0
    
class VATBasketWithItems extends BasketWithItems
  totalWithVAT: ->
    Math.round(@total() * 1.20)

class DeliveryVATBasketWithItems extends VATBasketWithItems
  totalWithDelivery: -> 
    @total() + 250 + (50 * @numberOfItems())

  totalWithVATAndDelivery: -> 
    Math.round(@totalWithDelivery() * 1.20)


exports.BasketFactory = BasketFactory
exports.EmptyBasket = EmptyBasket
exports.BasketWithItems = BasketWithItems
exports.VATBasketWithItems = VATBasketWithItems
exports.DeliveryVATBasketWithItems = DeliveryVATBasketWithItems