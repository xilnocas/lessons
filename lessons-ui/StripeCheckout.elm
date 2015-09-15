module StripeCheckout where

import Html exposing (Html, node, form)
import Html.Attributes exposing (attribute, action, method, enctype)

checkout : Html
checkout =
    node "script"
        (List.map (uncurry attribute) [ ("src","https://checkout.stripe.com/checkout.js" )
                                      , ("class","stripe-button")
                                      , ("data-key","pk_test_Y31x7Mqyi1iY63IQb95IAORm")
                                      --, ("data-image","/img/documentation/checkout/marketplace.png")
                                      , ("data-name","nicklawls.github.io")
                                      , ("data-description","2 widgets")
                                      , ("data-amount","2000")
                                      , ("data-locale","auto")
                                      ])
        []

checkoutForm : Html
checkoutForm =
    form
        [ action "http://localhost:8081/charges"
        , method "POST"
        , enctype "application/x-www-form-urlencoded"
        ]
        [checkout]

main : Html
main = checkoutForm