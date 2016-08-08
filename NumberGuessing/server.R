#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

#the computer guesses an integer between
number <- floor(runif(1,1,1000))

numberguessed <- function(guess, number) {
  returnValue <- "No Value Entered, Please Enter a Value."
  if (guess > 1000) {
  
    returnValue <- 'Value Exceeds the given range, please enter a value below 1000 '
  }
  else if (guess < 1) {
    #print(guess)
    returnValue <- 'Value below 1 is not advisable, select value within the range of 1-1000 '
  }
  else if (guess > number) {
    returnValue <- 'Predicted Value is higher, Go Again :D'
  }
  else if (guess < number) {
    returnValue <- 'Ah!, you predicted the value lower this time, why dont you try another number '
  }
  else if (guess == number) {
    returnValue <- 'BINGO BUDDY'
  }
  returnValue
}
shinyServer( 
  function(input, output) {
    output$inputValue <- renderPrint({as.numeric(input$guess)})
    
    output$outputValue <- renderText({
      if (input$goButton == 0) "You have not guessed a number yet"
      else if (input$goButton >= 1) numberguessed(as.numeric(input$guess), number)
    })
  }
)
