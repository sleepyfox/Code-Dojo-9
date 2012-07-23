VAT_MULTIPLIER = 1.20
DELIVERY_BASE_PRICE = 250
DELIVERY_PER_ITEM_PRICE = 50

class BasketFactory
  constructor: ->

  getEmptyBasket: ->
    new EmptyBasket

  getBasket: ->
    new Basket

  getBasketWithVAT: ->
    new VATBasket(new Basket)

  getBasketWithDelivery: ->
    new DeliveryBasket(new Basket)

  getBasketWithVATAndDelivery: ->
    new VATBasket(new DeliveryBasket(new Basket))

class EmptyBasket
  constructor: ->
  total: -> 0
  isEmpty: -> true

class Basket extends EmptyBasket
  constructor: ->
    @items = new Array

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
    
class Decorator extends Basket
  constructor: (@basket) ->
    @items = basket.items
    
class DeliveryBasket extends Decorator
  total: () ->
    @basket.total() + 250 + @basket.numberOfItems() * 50

class VATBasket extends Decorator
  total: () ->
    Math.round(@basket.total() * 1.20)

exports.BasketFactory = BasketFactory
exports.EmptyBasket = EmptyBasket
exports.Basket = Basket