*** Settings ***
Resource  F:/RobotScripts/amazon/Resources/PO/LandingPage.robot
Resource  F:/RobotScripts/amazon/Resources/PO/TopNav.robot
Resource  F:/RobotScripts/amazon/Resources/PO/SearchResults.robot
Resource  F:/RobotScripts/amazon/Resources/PO/Product.robot
Resource  F:/RobotScripts/amazon/Resources/PO/Cart.robot
Resource  F:/RobotScripts/amazon/Resources/PO/SignIn.robot

*** Keywords ***
Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for Products
    SearchResults.Verify Search Completed

Select Product from Search Results
    SearchResults.Click Product link
    Product.Verify Page Loaded

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    SignIn.Verify Page Loaded