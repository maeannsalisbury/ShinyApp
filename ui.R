library(shiny)

# Define UI for application that predicts health risks based on Body Massy Index (BMI).
shinyUI(pageWithSidebar (
  
  # Application title
  headerPanel ("BMI Calculator"),
  
  # Sidebar with controls to enter in weight and height
  sidebarPanel(
    selectInput("genderSet", "What is your gender:",
                choices = c("Female", "Male")),
    numericInput("weight", "Enter your weight:", 125),
    radioButtons("weightUnits", "Choose the unit of weight:",
                 list("Pounds (lbs)",
                      "Kilograms (kg)")),
    numericInput("height", "Enter your height:", 64),
    radioButtons("heightUnits", "Choose the unit of height:",
                 list("inches",
                      "meters")),
    actionButton("submit", "Submit")
    ),
  mainPanel(
    tabsetPanel(
      tabPanel("BMI Calc",
          h3('Calculated Body Mass Index'),
          h3(), h3(),
          h5('For your gender, you entered '),
          verbatimTextOutput("genderValue"),
          h5('Based on your weight of '), 
          verbatimTextOutput("weightValue"), 
          h5('in units of '), 
          verbatimTextOutput("weightUnit"),
          h5('and your height of '), 
          verbatimTextOutput("heightValue"), 
          h5('in units of '), 
          verbatimTextOutput("heightUnit"),
          h5('your BMI is '), 
          verbatimTextOutput("bmi"),
          h2(),
          h2(),
          h4('Based on your gender and calculated BMI, your risk for disease is '),
          verbatimTextOutput("healthRisk")),
      tabPanel("Documentation", helpText("BMI is an estimate of body fat and a good measure of your  risk for diseases that can occur with overweight and obesity. 
                                          For adults, a healthy weight is defined as the appropriate body weight in relation to height. This ratio of weight to height is known 
                                          as the body mass index (BMI). People who are overweight (BMI of 25-29.9) have too much body weight for their height. People who are
                                          obese (BMI of 30 or above) almost always have a large amount of body fat in relation to their height. The higher the BMI, the higher
                                          the risk for heart disease, high blood pressure, type 2 diabetes, gallstones, osteoarthritis, sleep apnea, and certain cancers (e.g., 
                                          colon, breast, endometrial, and gallbladder).
                                         
                                          This shiny app approximates BMI in kilograms per meter squared (kg/m2). There is evidence to support the use of BMI in risk assessment 
                                          since it provides a more accurate measure of total body fat compared with the assessment of body weight alone.
                                         
                                          To get an accurate personal BMI calculation, follow the following directions:
                                          
                                          -  1.  Using the drop-down box, select your gender
                                          -  2.  Enter your weight
                                          -  3.  Choose the units for your weight.  If using the Imperial system, choose Pounds (lbs).  Otherwise, if using the Metric system, then choose
                                                 Kilograms (kg)
                                          -  4.  Enter your height
                                          -  5.  Choose the units for your height.  If using the Imperial system, choose Inches.  Otherwise, if using the Metric system, then choose
                                                 Meters"))
          )  
  )
  ))