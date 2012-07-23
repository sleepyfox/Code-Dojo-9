VAT_MULTIPLIER = 1.20
DELIVERY_BASE_PRICE = 250
DELIVERY_PER_ITEM_PRICE = 50

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
    Math.round(@total() * VAT_MULTIPLIER)

class DeliveryVATBasketWithItems extends VATBasketWithItems
  totalWithDelivery: -> 
    @total() + DELIVERY_BASE_PRICE + (DELIVERY_PER_ITEM_PRICE * @numberOfItems())

  totalWithVATAndDelivery: -> 
    Math.round(@totalWithDelivery() * VAT_MULTIPLIER)


exports.BasketFactory = BasketFactory
exports.EmptyBasket = EmptyBasket
exports.BasketWithItems = BasketWithItems
exports.VATBasketWithItems = VATBasketWithItems
exports.DeliveryVATBasketWithItems = DeliveryVATBasketWithItems