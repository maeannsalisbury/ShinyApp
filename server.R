library(shiny)

bmiCalculation <- function(genderSet, weight, weightUnits, height, heightUnits)
  {
    if (weightUnits == 'Pounds (lbs)'){
        x.weight <- weight * 703 }
    else { 
        x.weight <- weight 
      }
    y.height <- height^2
    bmi <<- x.weight/y.height
    bmi
  }

 healthAssessment <- function(genderSet, weight, weightUnits, height, heightUnits)
 {
   if (weightUnits == 'Pounds (lbs)'){
     x.weight <- weight * 703 }
   else { 
     x.weight <- weight 
   }
   y.height <- height^2
   bmiValue <<- x.weight/y.height
   
   if (bmiValue < 18.5) {risk <- "Underweight; Very Low Risk"}
   else if ((bmiValue >= 18.5) && (bmiValue <= 24.9)) {risk <- "Normal; Low Risk"}
   else if ((bmiValue >= 25.0) && (bmiValue <= 29.9)) {risk <- "Overweight; Increased Risk"}
   else if ((bmiValue >= 30.0) && (bmiValue <= 34.9)) {risk <- "Obese Class I; High Risk"}
   else if ((bmiValue >= 35.0) && (bmiValue <= 39.9)) {risk <- "Obese Class II; Very High Risk"}
   else  risk <- "Obese Class III; Extremely High Risk"
   risk
  }

  
shinyServer(
  function(input, output) {
    output$genderValue <- renderPrint({input$genderSet})
    output$weightValue <- renderPrint({input$weight})
    output$weightUnit <- renderPrint({input$weightUnits})
    output$heightValue <- renderPrint({input$height})
    output$heightUnit <- renderPrint({input$heightUnits})
    output$bmi <- renderPrint({bmiCalculation(input$genderSet, input$weight, input$weightUnits, input$height, input$heightUnits)})
    output$healthRisk <- renderPrint({healthAssessment(input$genderSet, input$weight, input$weightUnits, input$height, input$heightUnits)})
  }
    )


