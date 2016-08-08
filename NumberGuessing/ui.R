#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI( pageWithSidebar(
  # Application title
  headerPanel("Impossible Number Guess Game from 1 - 1000"),
  
  sidebarPanel(
    #numericInput('guess', 'Number', 1, min = 1, max = 1000, step = 1),
    #submitButton('Submit')
    textInput('guess', 'Input thy Number', value = ""),
    h5('Press CHECK to check if the number you have inputed matches the impossible random number to guess :P'),
    actionButton("goButton", "CHECK")
    
  ), 
  mainPanel(
   
    h3('Your Guess Work'),
    h4('This is what you think the number would be'),
    verbatimTextOutput("inputValue"),
    h4('Which is...'),
    verbatimTextOutput("outputValue"),
    h5('NOTE: Coding game is going strong, will surely Improvise, Thank you guys have fun playing an impossible to guess number game :D'),
    h5('Game Ends here')
    )
    )
)
