﻿redirectToCheckout = function (sessionId) {
    var stripe = Stripe("pk_test_51MoPKCH3TLQLEjzLYF3YEql4uJT6F3rPoTaoBy74kJvhERQD0eOQn9ew9D5ALCBDDLmJvFc7tki8uCzDWSzadLUC00LM3BrnNf")
    stripe.redirectToCheckout({ sessionId: sessionId });
}